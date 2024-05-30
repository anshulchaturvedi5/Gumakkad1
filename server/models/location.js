const mongoose = require("mongoose");

const locationSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  description: {
    type: String,
    required: true,
    trim: true,
  },
  images: {
    type: String,
    required: true,
    trim: true,
  },
});

const Location = mongoose.model("Location", locationSchema);
module.exports = { Location, locationSchema };
