# Islanding Detection

## About

This repository contains a study case of the work developed by Manikonda, S et al. in *IDM based on image classification with CNN*. Here is shown a CNN approach for islanding detection cases. Also is presented a way to generate islanding detection images. [1]

## Work Environment

To use this repository it is essential to use the 2020a version (or upper) of MATLAB.
For python see [SETUP](SETUP.md)

## How it works?

### Image Generation.

Before init with the simulation, you must to run the [*power_PVarray_100kW_param.m*](power_PVarray_100kW_param.m) file (you can change the parameters inside if you want). Then, in the [*script_get_train_data.m*](script_get_train_data.m), in the first cell (*Create Structures*) you can define the scenarios that you want to simulate, there you can select *one* sceneraio among 'normal_C_on', 'normal_C_off', 'turning_off_C_load', 'turning_on_C_load', 'islanding_on_C', 'islanding_off_C', 'LL-fault' and 'LN-fault'. There also, you can define the number of scenarios that you want to simulate. Later, run the section *Collect data set*, that will create the dataset. This dataset will be allocated in the folder [*data*](data), the start and final time of simulation can be changed in the variables: *initial_sample* and *final_sample*, respectively, which are set in 0.2 and 0.35 seconds. [2]

### CNN Training.

All the project development is self content in the [*Islanding Detection with CNN.ipynb*](data/Islanding_Detection_with_CNN.ipynb) notebook, feel free if you want to modify some parameters and run different train experiments. To download the data used for training and testing the created model, please refer to the next link: https://drive.google.com/drive/folders/1wF7zXQ-P3h1igH2LaGsYg9kTaU-e0_vj?usp=sharing

### Demo

To use the demo run the demo.py file that has the following arguments:

- **data_path**: Path with the test data (default: "data/test_data.npy")
- **labels_path**: Path with the demo labels (default: "data/test_labels.npy").
- **model_path**: Path .h5 model for binary classification (default: "data/model/islanding_model.h5.")

Example:

```sh
$ python demo.py
```

## Citing Work

```BibTeX
@article{gaviria_machine_2022,
	title = {Machine learning in photovoltaic systems: A review},
	issn = {0960-1481},
	url = {https://www.sciencedirect.com/science/article/pii/S0960148122009454},
	doi = {10.1016/j.renene.2022.06.105},
	shorttitle = {Machine learning in photovoltaic systems},
	abstract = {This paper presents a review of up-to-date Machine Learning ({ML}) techniques applied to photovoltaic ({PV}) systems, with a special focus on deep learning. It examines the use of {ML} applied to control, islanding detection, management, fault detection and diagnosis, forecasting irradiance and power generation, sizing, and site adaptation in {PV} systems. The contribution of this work is three fold: first, we review more than 100 research articles, most of them from the last five years, that applied state-of-the-art {ML} techniques in {PV} systems; second, we review resources where researchers can find open data-sets, source code, and simulation environments that can be used to test {ML} algorithms; third, we provide a case study for each of one of the topics with open-source code and data to facilitate researchers interested in learning about these topics to introduce themselves to implementations of up-to-date {ML} techniques applied to {PV} systems. Also, we provide some directions, insights, and possibilities for future development.},
	journaltitle = {Renewable Energy},
	shortjournal = {Renewable Energy},
	author = {Gaviria, Jorge Felipe and Narváez, Gabriel and Guillen, Camilo and Giraldo, Luis Felipe and Bressan, Michael},
	urldate = {2022-07-03},
	date = {2022-07-01},
	langid = {english},
	keywords = {Deep learning, Machine learning, Neural networks, Photovoltaic systems, Reinforcement learning, Review},
	file = {ScienceDirect Snapshot:C\:\\Users\\jfgf1\\Zotero\\storage\\G96H46L2\\S0960148122009454.html:text/html},
},

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
[1] Jorge Felipe Gaviria, Gabriel Narváez, Camilo Guillen, Luis Felipe Giraldo, and Michael Bressan. Machine learning in photovoltaic systems: A review. ISSN 0960-1481. doi: 10.1016/j.renene.2022.06.105. URL https://www.sciencedirect.com/science/article/pii/S0960148122009454?via%3Dihub

[2] Manikonda, S. K., & Gaonkar, D. N. (2019). IDM based on image classification with CNN. The Journal of Engineering, 2019(10), 7256-7262.

[3] Giroux, P., Sybille, G., Osorio, C., & Chandrachood, S. (2014). Detailed Model of a 100-kW Grid-Connected PV Array.

## Licenses

### Software
The software is licensed under an [MIT License](https://opensource.org/licenses/MIT). A copy of the license has been included in the repository and can be found [here](https://github.com/SmartSystems-UniAndes/PV_MPPT_Control_Based_on_Reinforcement_Learning/blob/main/LICENSE-MIT.txt).
