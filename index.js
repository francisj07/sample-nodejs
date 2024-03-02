const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

var LoremIpsum = require('lorem-ipsum').LoremIpsum;

var lorem = new LoremIpsum({
  sentencesPerParagraph: {
    max: parseInt(process.env.MAX_SENTENCES_PER_PARAGRAPH) || 8,
    min: parseInt(process.env.MIN_SENTENCES_PER_PARAGRAPH) || 4
  },
  wordsPerSentence: {
    max: parseInt(process.env.MAX_WORDS_PER_SENTENCE) || 16,
    min: parseInt(process.env.MIN_WORDS_PER_SENTENCE) || 4
  }
});

app.get('/', (req, res) => res.send(lorem.generateParagraphs(7)));

app.listen(port, () => console.log(`Example app listening on port ${port}!`));

