const Event = require("../structures/event.js");
const { ActivityType } = require("discord.js");

module.exports = new Event("ready", (client) => {
  console.log("--------- TRAP-Music is ready! ---------");
  client.user.setActivity(`${client.prefix}help`, {
    type: ActivityType.Listening,
  });
});
