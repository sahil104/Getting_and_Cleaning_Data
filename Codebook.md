Codebook explaining the different variables used and any transformations applied in scripts for data cleaning project.

-----
<B> Data </B>
train_X: Training Data file
test_X: Test Data file
train_Y: Training Label file
test_Y: Test Label file
train_sub: Training subject file
test_sub: Test subject file
features: features/collumn name file
activity: lookup file for label names

<b> Transformation/ Output files </B>
all_data: test and train data merged
all_labels: test and train labels merged
all_sub: test and train subjects merged
full_set2: final output file
meansd_data: data with only mean and std deviation collumns
summary: mean for all subject, activity combination on 'meansd_data'
