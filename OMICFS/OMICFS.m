function Fopt = OMICFS(CFmic,N,Num,class,feature,varargin)
%=========================================================================%
%                    选择当前子集的主要特征(predominant feature)           %
%=========================================================================%
% Description:
%    从当前最优子集中选择当前子集的主要特征
% 
%-------------------------------------------------------------------------
% 输入： 
%       CFmic    特征和类之间的MIC
%       N        样本数
%       Num      最优特征数
%       class    类
%       feature  特征矩阵
% 输出：
% 		Fopt     最优特征子集
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
    CFmic  = CFmic(Forder);            % log 10 还是 log 2 还是 ln TODO
end

%% main step1
Fopt      = Forder(1);            % 选中的特征
Forder(1) = [];                   % 剩余
Q         = feature(:,Fopt)./norm(feature(:,Fopt));% 保存每次正交化的结果

%% step 2-
while length(Fopt) < Num
    [index,q]     = OMICFSS(feature(:,Forder),Q,class);
    Q             = [Q,q];
    Fopt          = [Fopt,Forder(index)];% 更新最优特征子集
    Forder(index) = [];                  % 更新原始集
end
