function FStage1 = Two_Stage_MIC(CFmic,FFmic,varargin)
%=========================================================================%
%                             ѡ��ǰ�ӵ�ǰ�����Ӽ�                       %
%=========================================================================%
% Description:
%    �ӵ�ǰ�����Ӽ���ѡ��ǰ�Ӽ�����Ҫ����
% 
%-------------------------------------------------------------------------
% ���룺 
%       CFmic    ��������֮���MIC
%       FFmic    ����������֮���MIC 
%       index    i  
% �����
% 		FStage1  ��ǰ�����Ӽ�
%--------------------------------------------------------------------------
%  thet --- default = 0.5(0,1)
% Reference:
%   2019-Maximal Information Coefficient-Based Two-Stage Feature Selection
% Method for Railway Condition Monitoring

%% 
thet                = [];
if length(varargin) >=1
    thet            = varargin{1};
end      
if isempty(thet)
    thet            = 0.5;
end

%% Stage1 ѡ������ǿ��������,����2/3
[CFmicSort,Forder]  = sort(CFmic,'descend');
CFmicStage1         = CFmicSort(1:2*round(length(CFmic)/3));
FStage1             = Forder(1:2*round(length(CFmic)/3));

%% ��ȫ 
for i = 1:size(FFmic,1)-1
    FFmic(i:end,i) = FFmic(i,i:end);
end
FFmic             = FFmic + diag(ones(size(FFmic,1),1));
FFmicSelected       = FFmic(FStage1,FStage1);

%% Stage1 ѡ���໥֮�������Ե͵�����(��̭����֮��MIC������ֵ)
k                   = 1;
while k<length(FStage1)
     if sum(FFmicSelected(1:k,k)>thet)>0
         FStage1(k) = [];
     end
     k = k + 1;
end
