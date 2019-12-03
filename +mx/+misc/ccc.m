%
%   Clear all variables, times, etc..
%
% 	Written by: Mark Bruurmijn
%
if ~isempty(timerfindall), delete(timerfindall); end
if ~isempty(instrfindall), fclose(instrfindall); delete(instrfindall); end

clear
clear global
close all force

clc
