%--------------------------------------------------------------------------
% HDL Workflow Script
% Generated with MATLAB 24.2 (R2024b) at 17:44:35 on 27/04/2026
% This script was generated using the following parameter values:
%     Filename  : 'C:\Users\valen\Documents\FIB_barcelone\Cours\PD\LRN\hdlworkflow_LRN_double.m'
%     Overwrite : true
%     Comments  : true
%     Headers   : true
%     DUT       : 'LRN/HDL_DUT'
% To view changes after modifying the workflow, run the following command:
% >> hWC.export('DUT','LRN/HDL_DUT');
%--------------------------------------------------------------------------

%% Load the Model
load_system('LRN');

%% Restore the Model to default HDL parameters
%hdlrestoreparams('LRN/HDL_DUT');

%% Model HDL Parameters
%% Set Model 'LRN' HDL parameters
hdlset_param('LRN', 'AdaptivePipelining', 'on');
hdlset_param('LRN', 'CriticalPathEstimation', 'on');
fpconfig = hdlcoder.createFloatingPointTargetConfig('NATIVEFLOATINGPOINT' ...
, 'VendorFloatingPointLibrary', 'AMDFLOATINGPOINTOPERATORS');fpconfig.VendorLibrarySettings.DSPSliceUsage = 'FULL';


hdlset_param('LRN', 'FloatingPointTargetConfiguration', fpconfig);
hdlset_param('LRN', 'HDLSubsystem', 'LRN/HDL_DUT');
hdlset_param('LRN', 'ProjectFolder', 'hdl_prj_LRN');
hdlset_param('LRN', 'SynthesisTool', 'Xilinx Vivado');
hdlset_param('LRN', 'SynthesisToolChipFamily', 'Zynq');
hdlset_param('LRN', 'SynthesisToolDeviceName', 'xc7z020');
hdlset_param('LRN', 'SynthesisToolPackageName', 'clg400');
hdlset_param('LRN', 'SynthesisToolSpeedValue', '-1');
hdlset_param('LRN', 'TargetDirectory', 'hdl_prj_LRN\hdlsrc');
hdlset_param('LRN', 'TargetFrequency', 100);
hdlset_param('LRN', 'TargetLanguage', 'Verilog');
hdlset_param('LRN', 'UseFloatingPoint', 'on');


%% Workflow Configuration Settings
% Construct the Workflow Configuration Object with default settings
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx Vivado','TargetWorkflow','Generic ASIC/FPGA');

% Specify the top level project directory
hWC.ProjectFolder = 'hdl_prj_LRN';
hWC.AllowUnsupportedToolVersion = true;

% Set Workflow tasks to run
hWC.RunTaskGenerateRTLCodeAndTestbench = true;
hWC.RunTaskVerifyWithHDLCosimulation = false;
hWC.RunTaskCreateProject = true;
hWC.RunTaskRunSynthesis = true;
hWC.RunTaskRunImplementation = true;
hWC.RunTaskAnnotateModelWithSynthesisResult = true;

% Set properties related to 'RunTaskGenerateRTLCodeAndTestbench' Task
hWC.GenerateRTLCode = true;
hWC.GenerateTestbench = false;
hWC.GenerateValidationModel = false;

% Set properties related to 'RunTaskCreateProject' Task
hWC.Objective = hdlcoder.Objective.None;
hWC.AdditionalProjectCreationTclFiles = '';

% Set properties related to 'RunTaskRunSynthesis' Task
hWC.SkipPreRouteTimingAnalysis = false;

% Set properties related to 'RunTaskRunImplementation' Task
hWC.IgnorePlaceAndRouteErrors = false;

% Set properties related to 'RunTaskAnnotateModelWithSynthesisResult' Task
hWC.CriticalPathSource = 'pre-route';
hWC.CriticalPathNumber =  1;
hWC.ShowAllPaths = false;
hWC.ShowDelayData = true;
hWC.ShowUniquePaths = false;
hWC.ShowEndsOnly = false;
hWC.AnnotateModel = 'generated';

% Validate the Workflow Configuration Object
hWC.validate;

%% Run the workflow
hdlcoder.runWorkflow('LRN/HDL_DUT', hWC);
