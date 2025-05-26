# OMRON MX2 Series Type V1 Inverter Parameter Generator (3G3MX2-V1)

An expert system that automatically generates optimal OMRON MX2 VFD parameters from motor and drive specifications.

## Features

- 🚀 **Automated Configuration** - Generates precise VFD settings from simple YAML input
- ⚡ **Error Reduction** - Eliminates manual calculation mistakes
- � **Two Output Modes** - View full parameters or only changed values
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

## Usage

### Basic Command
```sh
vfdparam [OPTIONS] SPEC_YAML_FILENAME
```

### Options
| Option           | Short Form | Default | Description |
|------------------|------------|---------|-------------|
| `--changed-only` | `-c`       | `false` | Output only parameters that differ from defaults |
| `--help`         | `-h`       | `false` | Display help message and exit |
| `--output-file`  | `-o FILE`  | STDOUT  | Write output to specified file |

### Examples

#### 1. Generate all parameters (default)
```sh
vfdparam motor_config.yaml
```

#### 2. Show only modified parameters
```sh
vfdparam -c motor_config.yaml
# Equivalent to:
vfdparam --changed-only motor_config.yaml
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
```

### Output Interpretation
- Parameters are output in YAML format
- Each line shows: `ParameterCode: Value  # Description`
- When using `-c`, only non-default values are shown
