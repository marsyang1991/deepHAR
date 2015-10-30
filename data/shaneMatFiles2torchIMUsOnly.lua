require 'mattorch'
loading = mattorch.load('opp2IMUsOnly.mat')

data = {}

data.classes={}
data.training={}
data.test={}
data.validation={}

--data.classes = torch.totable(loading.classes)[1]
data.classes = torch.totable(torch.range(1,18))

data.training.inputs = loading.trainingData
data.training.targets = torch.squeeze(loading.trainingLabels)

-- Make test and validation sets the same for now...
data.test.inputs = loading.testingData
data.test.targets = torch.squeeze(loading.testingLabels)

data.validation.inputs = data.test.inputs
data.validation.targets = data.test.targets

torch.save('opp2IMUsOnly.dat',data)