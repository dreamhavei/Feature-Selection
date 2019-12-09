function FStage1 = Two_Stage_MIC(CFmic,FFmic,varargin)
%=========================================================================%
%                             选择当前子当前最优子集                       %
%=========================================================================%
% Description:
%    从当前最优子集中选择当前子集的主要特征
% 
%-------------------------------------------------------------------------
% 输入： 
%       CFmic    特征和类之间的MIC
%       FFmic    特征和特征之间的MIC 
%       index    i  
% 输出：
% 		FStage1  当前最优子集
%--------------------------------------------------------------------------
%  thet --- default = 0.5(0,1)
% Reference:
%   2019-Maximal Information Coefficient-Based Two-Stage Feature Selection
% Method for Railway Condition Monitoring
%
% version 1.0 -- January/2019
% Implemented by: Liyu Yang
% Contact Info  : yangliyuokn@sina.cn

%% 
thet                = [];
if length(varargin) >=1
    thet            = varargin{1};
end      
if isempty(thet)
    thet            = 0.5;
end

%% Stage1 选择与类强联的特征,保留2/3
[CFmicSort,Forder]  = sort(CFmic,'descend');
CFmicStage1         = CFmicSort(1:2*round(length(CFmic)/3));
FStage1             = Forder(1:2*round(length(CFmic)/3));

%% 补全 
for i = 1:size(FFmic,1)-1
    FFmic(i:end,i) = FFmic(i,i:end);
end
FFmic             = FFmic + diag(ones(size(FFmic,1),1));
FFmicSelected       = FFmic(FStage1,FStage1);

%% Stage1 选择相互之间冗余性低的特征(淘汰特征之间MIC大于阈值)
k                   = 1;
res = [];
while k<size(FFmicSelected,1)
     if sum(FFmicSelected(1:(k-1),k)>thet)>0
         res = [res,k];
     end
     k = k + 1;
end
FStage1(res) = [];
