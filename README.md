# docker-fing 
## adapted for use as device-tracker with node-red and HA.
forked from: https://github.com/gmacario/docker-fing

Docker image for the [Fing CLI](https://www.fing.io/fingkit-sdk-downloads/).


### Build
use the `build.sh` to build with default arguments
@todo: expand building info

### Run
use the `run.sh` bash script to run the docker container with defaults,
* adapt the volume path to your own needs! `@todo: make this more general`

### Use with node-red and Home Assistant
* Share data folder from volume with Node-Red container,
* import flows from `nodeRedFlow.json`,
* configure mqtt server and filepath from volume,
* by default devices config will be published to `homeassistant/device_tracker/{mac}/config`
* by default devices state will be published to `homeassistant/device_tracker/{mac}/state`
* by default devices atrrsibute will be published to `homeassistant/device_tracker/{mac}/attributes`
* set MQTT `autodiscover` to `true` & enjoy your new devices in HA.

`@todo: expand info`

### License

docker-fing is licensed under the MIT License - for details please see the `LICENSE` file.

Copyright (C) 2018, [Gianpaolo Macario](http://gmacario.github.io/)

<!-- EOF -->
