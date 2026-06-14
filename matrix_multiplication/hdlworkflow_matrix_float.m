%--------------------------------------------------------------------------
% HDL Workflow Script
% Generated with MATLAB 24.2 (R2024b) at 15:11:15 on 27/04/2026
% This script was generated using the following parameter values:
%     Filename  : 'C:\Users\valen\Documents\FIB_barcelone\Cours\PD\matrix_multiplication\hdlworkflow_matrix_float_MAX.m'
%     Overwrite : true
%     Comments  : true
%     Headers   : true
%     DUT       : 'matrix_multiplication/HDL_DUT'
% To view changes after modifying the workflow, run the following command:
% >> hWC.export('DUT','matrix_multiplication/HDL_DUT');
%--------------------------------------------------------------------------

%% Load the Model
load_system('matrix_multiplication');

%% Restore the Model to default HDL parameters
%hdlrestoreparams('matrix_multiplication/HDL_DUT');

%% Model HDL Parameters
%% Set Model 'matrix_multiplication' HDL parameters
hdlset_param('matrix_multiplication', 'AdaptivePipelining', 'on');
hdlset_param('matrix_multiplication', 'CriticalPathEstimation', 'on');
fpconfig = hdlcoder.createFloatingPointTargetConfig('NATIVEFLOATINGPOINT' ...
, 'VendorFloatingPointLibrary', 'AMDFLOATINGPOINTOPERATORS');fpconfig.VendorLibrarySettings.DSPSliceUsage = 'FULL';


hdlset_param('matrix_multiplication', 'FloatingPointTargetConfiguration', fpconfig);
hdlset_param('matrix_multiplication', 'HDLSubsystem', 'matrix_multiplication/HDL_DUT');
hdlset_param('matrix_multiplication', 'ProjectFolder', 'hdl_prj_matrix');
hdlset_param('matrix_multiplication', 'SynthesisTool', 'Xilinx Vivado');
hdlset_param('matrix_multiplication', 'SynthesisToolChipFamily', 'Zynq');
hdlset_param('matrix_multiplication', 'SynthesisToolDeviceName', 'xc7z020');
hdlset_param('matrix_multiplication', 'SynthesisToolPackageName', 'clg400');
hdlset_param('matrix_multiplication', 'SynthesisToolSpeedValue', '-1');
hdlset_param('matrix_multiplication', 'TargetDirectory', 'hdl_prj_matrix\hdlsrc');
hdlset_param('matrix_multiplication', 'TargetFrequency', 100);
hdlset_param('matrix_multiplication', 'TargetLanguage', 'Verilog');
hdlset_param('matrix_multiplication', 'UseFloatingPoint', 'on');


%% Workflow Configuration Settings
% Construct the Workflow Configuration Object with default settings
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx Vivado','TargetWorkflow','Generic ASIC/FPGA');

% Specify the top level project directory
hWC.ProjectFolder = 'hdl_prj_matrix';
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
hdlcoder.runWorkflow('matrix_multiplication/HDL_DUT', hWC);
