function Fopt = OMICFS(CFmic,N,Num,class,feature,varargin)
%=========================================================================%
%                    ѡ��ǰ�Ӽ�����Ҫ����(predominant feature)           %
%=========================================================================%
% Description:
%    �ӵ�ǰ�����Ӽ���ѡ��ǰ�Ӽ�����Ҫ����
% 
%-------------------------------------------------------------------------
% ���룺 
%       CFmic    ��������֮���MIC
%       N        ������
%       Num      ����������
%       class    ��
%       feature  ��������
% �����
% 		Fopt     ���������Ӽ�
%--------------------------------------------------------------------------
%  lambda - default = 5.
%
% Reference:
%   2017-A filter feature selection method based on the Maximal Information
%  Coefficient and Gram-Schmidt Orthogonalization for biomedical data mining
%
% version 1.0 -- January/2019
% Implemented by: Liyu Yang
% Contact Info  : yangliyuokn@sina.cn

lambda              = [];
if length(varargin) >=1
    lambda          = varargin{1};
end
if isempty(lambda)
    lambda           = 5;
end

%%  Sure Independence Screening
[~,Forder]       = sort(CFmic,'descend');
if length(CFmic) > 3*N 
    Forder = Forder(1:lambda*N*log(N));
    CFmic  = CFmic(Forder);            % log 10 ���� log 2 ���� ln TODO
end

%% main step1
Fopt      = Forder(1);            % ѡ�е�����
Forder(1) = [];                   % ʣ��
Q         = feature(:,Fopt)./norm(feature(:,Fopt));% ����ÿ���������Ľ��

%% step 2-
while length(Fopt) < Num
    [index,q]     = OMICFSS(feature(:,Forder),Q,class);
    Q             = [Q,q];
    Fopt          = [Fopt,Forder(index)];% �������������Ӽ�
    Forder(index) = [];                  % ����ԭʼ��
end
