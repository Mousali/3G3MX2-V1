# VFD (Variable Frequency Drive) Parameter Calculator

An expert system that calculate VFD parameter values from YAML specification files.

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

## Why Prolog?

Because I can!

Also because Prolog is well suited for logical and relation rules base systems. Which is exactly calculating VFD parameters from specification is. Genreally, a prolog program is 10 to 120 lines less that equivalent Python or C program. 

In Prolog, code is data and data is code. As a result, the main program is actually extremely simple.  One line to load the rules -
```prolog
...
load_param_def(Yaml_spec.get(inverter/brand), Yaml_spec.get(inverter/model)),
...
```
, and one line to eacute the rules -
```prolog
findall([Param, Value], (
        ...
        call(Param,Value, Msg),
        ...
    ))
```

Rules for a particular VFD model are defined in a separate files and are loaded dynamically.  Rule files can be thought of as a database containing the logical relations between VFD parameters and their values based on a set of input specifications. This has several advantages:
- **Separation of Concerns**: The main program logic is clean and focused on execution, while rules are defined separately.
- **Extensibility**: New rules can be added without modifying the core logic, allowing for easy expansion to support more VFD models.
- **Reusability**: Rules can be reused across different projects or versions, promoting consistency and reducing duplication.
- **Flexibility**: Rules can be easily modified or extended to accommodate new requirements or changes in specifications.
- **Performance**: Prolog's logical inference engine efficiently handles complex relationships, making it suitable for this type of problem.
- **Modularity**: Each VFD model can have its own set of rules, making it easy to add or modify without affecting the core logic.
- **Maintainability**: Rules can be updated independently, allowing for quick adjustments as new models or requirements emerge.
- **Scalability**: New VFD models can be added by simply creating a new rules file, without changing the main program logic.

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

## 🙏 Sponsor

Many thanks to [CNC VOX](https://www.cncvox.com.au) for sponsoring this project and supporting open-source development.

Their contribution helps keep this project active and maintained.

## Contributing
We welcome contributions! If you have ideas, bug fixes, or improvements, please submit a pull request or open an issue.
