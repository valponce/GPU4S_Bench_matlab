%--------------------------------------------------------------------------
% HDL Workflow Script
% Generated with MATLAB 24.2 (R2024b) at 18:19:43 on 27/04/2026
% This script was generated using the following parameter values:
%     Filename  : 'C:\Users\valen\Documents\FIB_barcelone\Cours\PD\matrix_multiplication\hdlworkflow_matrix_int.m'
%     Overwrite : true
%     Comments  : true
%     Headers   : true
%     DUT       : 'matrix_multiplication_int/HDL_DUT'
% To view changes after modifying the workflow, run the following command:
% >> hWC.export('DUT','matrix_multiplication_int/HDL_DUT');
%--------------------------------------------------------------------------

%% Load the Model
load_system('matrix_multiplication_int');

%% Restore the Model to default HDL parameters
%hdlrestoreparams('matrix_multiplication_int/HDL_DUT');

%% Model HDL Parameters
%% Set Model 'matrix_multiplication_int' HDL parameters
hdlset_param('matrix_multiplication_int', 'AdaptivePipelining', 'on');
hdlset_param('matrix_multiplication_int', 'HDLSubsystem', 'matrix_multiplication_int/HDL_DUT');
hdlset_param('matrix_multiplication_int', 'ProjectFolder', 'hdl_prj_matrix_int');
hdlset_param('matrix_multiplication_int', 'SynthesisTool', 'Xilinx Vivado');
hdlset_param('matrix_multiplication_int', 'SynthesisToolChipFamily', 'Zynq');
hdlset_param('matrix_multiplication_int', 'SynthesisToolDeviceName', 'xc7z020');
hdlset_param('matrix_multiplication_int', 'SynthesisToolPackageName', 'clg400');
hdlset_param('matrix_multiplication_int', 'SynthesisToolSpeedValue', '-1');
hdlset_param('matrix_multiplication_int', 'TargetDirectory', 'hdl_prj_matrix_int\hdlsrc');
hdlset_param('matrix_multiplication_int', 'TargetFrequency', 100);
hdlset_param('matrix_multiplication_int', 'TargetLanguage', 'Verilog');


%% Workflow Configuration Settings
% Construct the Workflow Configuration Object with default settings
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx Vivado','TargetWorkflow','Generic ASIC/FPGA');

% Specify the top level project directory
hWC.ProjectFolder = 'hdl_prj_matrix_int';
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
hdlcoder.runWorkflow('matrix_multiplication_int/HDL_DUT', hWC);
