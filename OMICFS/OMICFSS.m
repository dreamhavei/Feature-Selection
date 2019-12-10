function [index,q] = OMICFSS(new,old,class)
%=========================================================================%
%                    选择当前子集的主要特征(predominant feature)           %
%=========================================================================%
% Description:
%    OMICFSS
% 
%-------------------------------------------------------------------------
% 输入： 
%       new      输入待选特征
%       old      对比集
%       class
% 输出：
%       index    最大的OMICFSS值对应索引
% 		q        最大的OMICFSS值的GSO值
%--------------------------------------------------------------------------
% Reference:
%   2017-A filter feature selection method based on the Maximal Information
%  Coefficient and Gram-Schmidt Orthogonalization for biomedical data mining
%
% version 1.0 -- January/2019
% Implemented by: Liyu Yang
% Contact Info  : yangliyuokn@sina.cn


parfor i      = 1:size(new,2)
     Q(:,i)   = GSO(new(:,i),old);  % 保存GSO求得结果
     Temp     = mine(Q(:,i)',class');
     Tmic(i)  = Temp.mic;
end
[~,index]     = max(Tmic);
q             = Q(:,index);

