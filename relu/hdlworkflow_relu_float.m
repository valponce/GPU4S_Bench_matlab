%--------------------------------------------------------------------------
% HDL Workflow Script
% Generated with MATLAB 24.2 (R2024b) at 23:17:56 on 14/06/2026
% This script was generated using the following parameter values:
%     Filename  : 'C:\Users\valen\Documents\FIB_barcelone\Cours\PD\relu\hdlworkflow_relu_float.m'
%     Overwrite : true
%     Comments  : true
%     Headers   : true
%     DUT       : 'relu_float/HDL_DUT'
% To view changes after modifying the workflow, run the following command:
% >> hWC.export('DUT','relu_float/HDL_DUT');
%--------------------------------------------------------------------------

%% Load the Model
load_system('relu_float');

%% Restore the Model to default HDL parameters
%hdlrestoreparams('relu_float/HDL_DUT');

%% Model HDL Parameters
%% Set Model 'relu_float' HDL parameters
hdlset_param('relu_float', 'AdaptivePipelining', 'on');
fpconfig = hdlcoder.createFloatingPointTargetConfig('NATIVEFLOATINGPOINT' ...
, 'VendorFloatingPointLibrary', 'AMDFLOATINGPOINTOPERATORS');fpconfig.VendorLibrarySettings.DSPSliceUsage = 'FULL';


hdlset_param('relu_float', 'FloatingPointTargetConfiguration', fpconfig);
hdlset_param('relu_float', 'HDLSubsystem', 'relu_float/HDL_DUT');
hdlset_param('relu_float', 'ProjectFolder', 'hdl_prj_relu_double');
hdlset_param('relu_float', 'SynthesisTool', 'Xilinx Vivado');
hdlset_param('relu_float', 'SynthesisToolChipFamily', 'Zynq');
hdlset_param('relu_float', 'SynthesisToolDeviceName', 'xc7z020');
hdlset_param('relu_float', 'SynthesisToolPackageName', 'clg400');
hdlset_param('relu_float', 'SynthesisToolSpeedValue', '-1');
hdlset_param('relu_float', 'TargetDirectory', 'hdl_prj_relu_double\hdlsrc');
hdlset_param('relu_float', 'TargetFrequency', 100);
hdlset_param('relu_float', 'TargetLanguage', 'Verilog');
hdlset_param('relu_float', 'UseFloatingPoint', 'on');


%% Workflow Configuration Settings
% Construct the Workflow Configuration Object with default settings
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx Vivado','TargetWorkflow','Generic ASIC/FPGA');

% Specify the top level project directory
hWC.ProjectFolder = 'hdl_prj_relu_double';
hWC.AllowUnsupportedToolVersion = true;

% Set Workflow tasks to run
hWC.RunTaskGenerateRTLCodeAndTestbench = true;
hWC.RunTaskVerifyWithHDLCosimulation = false;
hWC.RunTaskCreateProject = true;
hWC.RunTaskRunSynthesis = true;
hWC.RunTaskRunImplementation = false;
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
hdlcoder.runWorkflow('relu_float/HDL_DUT', hWC);
