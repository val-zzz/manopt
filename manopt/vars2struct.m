function s = vars2struct(varargin)
%VARS2STRUCT Convert variables to scalar structure.
%   S = VARS2STRUCT packs each variable in the caller worksapce into an
%   output structure.
%
%   S = VARS2STRUCT(A,B,C,___) packs the input variables into an output
%   structure, such that fieldnames correspond to input variable names.
%
%   See also STRUCT2VARS.

% Copyright 2016 Matthew R. Eicholtz

if nargin==0 %pack entire caller workspace into structure
    caller = evalin('caller','whos');
    for ii=1:length(caller)
        s.(caller(ii).name) = evalin('caller',caller(ii).name);
    end
else %pack inputs into structure
    for ii=1:length(varargin)
        s.(inputname(ii)) = varargin{ii};
    end
end

end

