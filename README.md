# Islanding Detection

## About

This repository contains a study case of the work developed by Manikonda, S et al. in *IDM based on image classification with CNN* [1]. Here is shown a CNN approach for islanding detection cases. Also is presented a way to generate islanding detection images. [1]

## Work Environment

To use this repository it is essential to use the 2020a version (or upper) of MATLAB.

## How it works?

### Image Generation.

Before init with the simulation, you must to run the [*power_PVarray_100kW_param.m*](power_PVarray_100kW_param.m) file (you can change the parameters inside if you want). Then, in the [*script_get_train_data.m*](script_get_train_data.m), in the first cell (*Create Structures*) you can define the scenarios that you want to simulate, there you can select *one* sceneraio among 'normal_C_on', 'normal_C_off', 'turning_off_C_load', 'turning_on_C_load', 'islanding_on_C', 'islanding_off_C', 'LL-fault' and 'LN-fault'. There also, you can define the number of scenarios that you want to simulate. Later, run the section *Collect data set*, that will create the dataset. This dataset will be allocated in the folder [*data*](data), the start and final time of simulation can be changed in the variables: *initial_sample* and *final_sample*, respectively, which are set in 0.2 and 0.35 seconds.

### CNN Training.

All the project development is self content in the [*Islanding_Detection/data/Islanding Detection with CNN.ipynb*](Islanding_Detection/data/Islanding Detection with CNN.ipynb) notebook, feel free if you want to modify some parameters and run different train experiments.

## Citing Work

```BibTeX
@article{manikonda2019idm,
  title={IDM based on image classification with CNN},
  author={Manikonda, Santhosh KG and Gaonkar, Dattatraya N},
  journal={The Journal of Engineering},
  volume={2019},
  number={10},
  pages={7256--7262},
  year={2019},
  publisher={IET}
}
```

## References

[1] Manikonda, S. K., & Gaonkar, D. N. (2019). IDM based on image classification with CNN. The Journal of Engineering, 2019(10), 7256-7262.
