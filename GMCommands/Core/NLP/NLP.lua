--[[
    BasicNLPModel Class

    This class represents a basic Natural Language Processing (NLP) model.

    Methods:
    - new(): Creates a new instance of the BasicNLPModel class.
    - train(dataset: table): Trains the NLP model using the provided dataset.
    - predict(sentence: string): Predicts the label for the given sentence.

    Example Usage:
    local model = BasicNLPModel.new()
    model:train(dataset)
    local label = model:predict("This is a test sentence.")
]]

-- BasicNLPModel Class Definition
local BasicNLPModel = {}
BasicNLPModel.__index = BasicNLPModel

-- Constructor
function BasicNLPModel.new()
    local self = setmetatable({}, BasicNLPModel)
    self.vocab = {}
    self.labels = {}
    self.wordCounts = {}
    self.labelCounts = {}
    self.wordLabelCounts = {}
    return self
end

-- Train the NLP model
function BasicNLPModel:train(dataset)
    -- Reset model data
    self.vocab = {}
    self.labels = {}
    self.wordCounts = {}
    self.labelCounts = {}
    self.wordLabelCounts = {}

    -- Process dataset
    for i, data in ipairs(dataset) do
        local sentence = data.sentence
        local label = data.label

        -- Update label counts
        if not self.labelCounts[label] then
            self.labelCounts[label] = 0
        end
        self.labelCounts[label] = self.labelCounts[label] + 1

        -- Tokenize sentence
        local tokens = self:tokenize(sentence)

        -- Update word counts and word-label counts
        for j, token in ipairs(tokens) do
            -- Update word counts
            if not self.wordCounts[token] then
                self.wordCounts[token] = 0
            end
            self.wordCounts[token] = self.wordCounts[token] + 1

            -- Update word-label counts
            if not self.wordLabelCounts[token] then
                self.wordLabelCounts[token] = {}
            end
            if not self.wordLabelCounts[token][label] then
                self.wordLabelCounts[token][label] = 0
            end
            self.wordLabelCounts[token][label] = self.wordLabelCounts[token][label] + 1
        end
    end

    -- Build vocabulary and labels
    for word, count in pairs(self.wordCounts) do
        table.insert(self.vocab, word)
    end
    for label, count in pairs(self.labelCounts) do
        table.insert(self.labels, label)
    end
end

-- Predict the label for a given sentence
function BasicNLPModel:predict(sentence)
    -- Tokenize sentence
    local tokens = self:tokenize(sentence)

    -- Calculate probabilities for each label
    local probabilities = {}
    for i, label in ipairs(self.labels) do
        local labelProbability = 1.0
        for j, token in ipairs(tokens) do
            local tokenProbability = 0.0
            if self.wordLabelCounts[token] and self.wordLabelCounts[token][label] then
                tokenProbability = self.wordLabelCounts[token][label] / self.labelCounts[label]
            end
            labelProbability = labelProbability * tokenProbability
        end
        probabilities[label] = labelProbability
    end

    -- Find the label with the highest probability
    local maxProbability = 0.0
    local predictedLabel = nil
    for label, probability in pairs(probabilities) do
        if probability > maxProbability then
            maxProbability = probability
            predictedLabel = label
        end
    end

    return predictedLabel
end

-- Tokenize a sentence into individual words
function BasicNLPModel:tokenize(sentence)
    local tokens = {}
    for token in sentence:gmatch("%w+") do
        table.insert(tokens, token)
    end
    return tokens
end


local model = BasicNLPModel.new()
model:train(Dataset_Items)
model:train(Dataset_Teleport)
model:train(Dataset_regions)

local predictedLabel = model:predict(userInput)

if predictedLabel == "add_item" then
    -- Code to add an item to the player's inventory
    addItemToInventory(player, itemDetails)  -- You'll define this function
elseif predictedLabel == "teleport" then
    -- Code to teleport the player
    teleportPlayer(player, destination)  -- You'll define this function
else
    -- Handle unrecognized or unimplemented labels
    print("label not recognized or not implemented.")
end