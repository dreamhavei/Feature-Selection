function Fopt = MIMIC_FS(CFmic,FFmic,varargin)
%=========================================================================%
%                    选择当前子集的主要特征(predominant feature)           %
%=========================================================================%
% Description:
%    从当前最优子集中选择当前子集的主要特征
% 
%-------------------------------------------------------------------------
% 输入： 
%       CFmic    特征和类之间的MIC
%       FFmic    特征和特征之间的MIC 
%       index    i
%       Fopt     当前最优子集
% 输出：
% 		Fopt 
%--------------------------------------------------------------------------
% Reference:
%   2018-Feature selection for IoT based on maximal information coefficient

thet = [];
if length(varargin) >=1
    thet      = varargin{1};
end      
if isempty(thet)
    thet           = 0.5;
end

[~,Forder]          = sort(CFmic,'descend'); % 前value 后index
% 选择当前子集的主要特征(predominant feature)   FFmic
PredFeature          = Forder(1);
Forder(1)            = [];
Fopt                 = PredFeature;
while ~isempty(Forder)
    PredFeature      = Forder(1);   % i    i和Fopt  getMainElement
%         disp([num2str(k),' Fopt=',num2str(Fopt),' PredFeature =',num2str(PredFeature)]);
    if (CFmic(PredFeature) - sum(FFmic([PredFeature,Fopt],[PredFeature,Fopt]))./length(Fopt)) < thet
        Forder(Forder==PredFeature) = []; 
    else
        Forder(Forder==PredFeature) = [];  
        Fopt                        = [Fopt,PredFeature];
    end
    MBfeature                       = findMBElement(PredFeature,Forder,CFmic,FFmic);  % 
    if ~isempty(MBfeature)
        if (sum(CFmic(MBfeature)) - sum(FFmic([MBfeature,Fopt],[MBfeature,Fopt]))./length(Fopt)) < thet
            Forder(Forder == MBfeature) = [];
        end
    end
end