const express = require("express");
const locationRouter = express.Router();
const { Location } = require("../models/location");

//get all locations
locationRouter.get("/api/locations/", async (req, res) => {
  try {
    const locations = await Location.find({});
    res.json(locations);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//get all locations addressWise
locationRouter.get("/api/locations/address/:name", async (req, res) => {
  try {
    const locations = await Location.find({
      address: { $regex: req.params.name, $options: "i" },
    });
    res.json(locations);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//get all location categorywise
locationRouter.get("/api/locations/category/:name", async (req, res) => {
  try {
    // const locations = await Location.find({ category: req.query.category });
    const locations = await Location.find({
      category: { $regex: req.params.name, $options: "i" },
    });
    res.json(locations);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//search location
locationRouter.get("/api/locations/search/:name", async (req, res) => {
  try {
    const locations = await Location.find({
      name: { $regex: req.params.name, $options: "i" },
    });
    res.json(locations);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = locationRouter;
