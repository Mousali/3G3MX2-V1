# VFD (Variable Frequency Drive) Parameter Calculator

An expert system that calculate VFD parameter values given a VFD and motor specification YAML file.

## Disclaimer
Use this code at your own risk. The author is not responsible for any damages or losses that may occur from using this code. Always test in a safe environment before deploying in production.

The authors are not affiliated with OMRON or any other VFD manufacturer. This project is an independent effort to provide a tool for calculating VFD parameters based on user specifications.

## Objectives

This project is not endorsed or supported by OMRON or any other VFD manufacturer. It is intended as demonstration for educational and informational purposes only. What I hope to achieve is to 
 - provide a tool that can help engineers and technicians quickly and accurately calculate VFD parameters based on their specific requirements.
 - demonstrate the potential of PROLOG and using expert systems and automation to simplify complex engineering tasks.
 - Make VFD parameter calculation more accessible to a wider audience, including those who may not have extensive experience with VFDs or electrical engineering.
 - Make VFD parameter specification testable and verifiable.
 - Make VFD parameter specification trackable using version control systems like Git.

> 🚧 **Project Under Construction** 🚧  
This project is currently in development and its functionality is limited. At present, the program only supports calculating parameters for the following VFD models:

- **Model:** 3G3MX2-A4150-V1(Q2)  
- **Brand:** OMRON

Support for additional models and features will be added in future updates. Stay tuned!

## Features

- 🚀 **Automated Configuration** - Generates VFD settings from simple YAML input
- ⚡ **Error Reduction** - Eliminates manual calculation
- � **Two Output Modes** - View full parameters or only calculated values
- 📁 **Flexible Output** - Print to console or save to file

## Background

Traditionally, hardware engineers manually deduce VFD settings based on fundamental principles, requiring deep expertise and extensive manual reading.

This project introduces an expert system that automates parameter generation. Users provide high-level configurations, and the system computes the optimal VFD settings, reducing errors and saving time.

## Motivation

| Traditional Approach | Our Solution |
|----------------------|--------------|
| ❌ Hours of manual work | ✅ Seconds to generate |
| ❌ Prone to human error | ✅ Consistent results |
| ❌ Requires deep expertise | ✅ Accessible to all engineers |
| ❌ Difficult to verify | ✅ Transparent calculations |

## Minimum System Requirements:
Docker is a requirement. 
Docker will download SWI prolog image and execute the script inside a container.

## Usage

### Basic Command
```sh
vfdparam [OPTIONS] [<spec_file> ...]
```

### Options
| Option           | Short Form | Description |
|------------------|------------|-------------|
| `--calculated-only` | `-c`       | Print calculated parameter values only |
| `--output-file`  | `-o FILE`  | Write output to file |
| `--help`         | `-h`       | Display this help message |

### Examples

#### 1. Generate all parameters (default)
```sh
vfdparam example_spec.yaml

# or split spec files
vfdparam vdf_spec.yaml motor_spec.yaml ...

# or path to spec files
vfdparam ./example_spec/*
```

#### 2. Show only modified parameters
```sh
vfdparam -c motor_config.yaml
# Equivalent to:
vfdparam --calculated-only motor_config.yaml
```

#### 3. Save output to file
```sh
vfdparam -o optimized_params.yaml motor_config.yaml
```

### Input File Structure
```yaml
inverter : 
    model : 3G3MX2-A4150-V1(Q2)
    brand : OMRON

power_grid:
    voltage:
        single_phase: 230
        three_phase: 400
    frequency: 50

motor :
    1st :
        brand : HQD
        model : GDZ-24
        power_kw : 3.0
        rpm :
            min : 3000
            base : 24000
            max : 24000
        poles : 2
        voltage : 220
...
```

### Output Interpretation
- Parameter values output to stdout or optional output file (YAML format)
- Each line shows: `ParameterCode: Value  # Description`
- When using `-c`, only calculated values are printed
