# mtt_assay
Analyze directly mtt assay absorbance results.

The script analyzes data from 96 wells plate data storaged in a excel file – see mtt_data_1.xlsx. The plate design is expected to be this format:

![design](https://i.ibb.co/44mgSd0/plate-design.png)

Each ratio used for the experiment (10:1, 8:1, 5:1, 2:1) is used with and without plasmid in two separated columns.

The calc used for viability is 

![formula](https://latex.codecogs.com/png.image?\dpi{110}&space;Viability.per.well&space;=&space;\frac{absorbance}{&space;\sum&space;\frac{positive.control.abosrbance}{number.of.positive.controls}})

The cell viability result is represented in a bar plot with standard deviation as error bars.
