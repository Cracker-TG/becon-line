import express from "express";
import controllers from "../controllers";

const routes = express.Router();

routes.post("/webhook", controllers.webhookController);

export default routes;
