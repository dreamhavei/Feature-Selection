function MB = findMBElement(index,Fopt,CFmic,FFmic)
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
% 		MB: MB(i) i的逼近马尔科夫毯
%--------------------------------------------------------------------------
% Reference:
%   2018-Feature selection for IoT based on maximal information coefficient
%
% version 1.0 -- January/2019
% Implemented by: Liyu Yang
% Contact Info  : yangliyuokn@sina.cn

MB = Fopt(and(bsxfun(@gt,CFmic(Fopt),CFmic(index)),bsxfun(@lt,CFmic(index),[(FFmic(Fopt(Fopt<index),index))',FFmic(index,Fopt(Fopt>=index))])));





