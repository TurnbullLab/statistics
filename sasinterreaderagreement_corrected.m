%% SAS inter-reader agreement

%% 
clear all
close all
clc
addpath BlandAltman
%% import

load readersegmentationdata_corrected.mat



mansegdata = readersegmentationdata_corrected(:,4);
read1data  = readersegmentationdata_corrected(:,1);
read2data  = readersegmentationdata_corrected(:,2);
read3data  = readersegmentationdata_corrected(:,3);
%% prepare bland-altman analysis

tit = ''; % figure title
gnames = {'Reader 1', 'Reader 2', 'Reader 3'}; % names of groups in data {dimension 1 and 2}
label = {'Manual Segmentation','Semi-automated Segmentation','mm^3'}; % Names of data sets
corrinfo = {'SSE','r2','eq'}; % stats to display of correlation scatter plot
BAinfo = {'RPC(%)','CV'}; % stats to display on Bland-ALtman plot
limits = 'auto'; % how to set the axes limits
data1mode = 'Truth';
diffvaluemode = 'absolute';

[cr, fig, statsStruct] = BlandAltman([mansegdata, mansegdata,mansegdata], [read1data, read2data, read3data],label,tit,gnames,'corrInfo',corrinfo,'baInfo',BAinfo,'axesLimits',limits,'data1Mode',data1mode, 'showFitCI',' on','diffValueMode',diffvaluemode,'markerSize',8,'symbols','sod');

% [cr, fig, statsStruct] = BlandAltman([mansegdata, mansegdata,mansegdata], [read1data, read2data, read3data],label,tit,gnames,'corrInfo',corrinfo,'baInfo',BAinfo,'axesLimits',limits,'data1Mode',data1mode, 'showFitCI',' on','diffValueMode','percent','markerSize',8,'symbols','sod');

% [cr, fig, statsStruct] = BlandAltman([mansegdata(2:end), mansegdata(2:end),mansegdata(2:end)], [read1data(2:end), read2data(2:end), read3data(2:end)],label,tit,gnames,'corrInfo',corrinfo,'baInfo',BAinfo,'axesLimits',limits,'data1Mode',data1mode, 'showFitCI',' on','diffValueMode','percent','markerSize',8,'symbols','sod');

% interplotnames1 = {'Reader 1', 'Reader 2'};
% interplotnames2 = {'Reader 1', 'Reader 3'};
% interplotnames3 = {'Reader 2', 'Reader 3'};
% 
% mansasplotnames1 = {'Manual Segmentation', 'Reader 1'};
% mansasplotnames2 = {'Manual Segmentation', 'Reader 2'};
% mansasplotnames3 = {'Manual Segmentation', 'Reader 3'};
% 
% 
% BlandAltman(read1data, read2data,interplotnames1,'diffValueMode','percent')
% BlandAltman(read1data, read3data,interplotnames2,'diffValueMode','percent')
% BlandAltman(read2data, read3data,interplotnames3,'diffValueMode','percent')
% 
% 
% BlandAltman(mansegdata, read1data,mansasplotnames1,'diffValueMode','percent')
% BlandAltman(mansegdata, read2data,mansasplotnames2,'diffValueMode','percent')
% BlandAltman(mansegdata, read3data,mansasplotnames3,'diffValueMode','percent')
% 
% 
% BlandAltman(repmat(mansegdata,[3,1]),[read1data;read2data;read3data],{'Manual Segmentation','SemiAutomated Segmentation'});