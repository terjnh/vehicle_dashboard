# Vehicle Dashboard
</br>

## UI build for a vehicle dashboard (SwipeView)

Written in Qt, QML and C++
</br>
</br>

### TO-DO

#### HOME PAGE
- [X] HomeDistance.qml
    - [ ] For aesthetics, keep distance timer with specific no. of "zeroes" in front of it
    - [X] Update QML component in HomeDistance.qml to reflect calculated distance per timeout (Distance meter in UI to update every second)
    - [X] Use speed value in Timer C++ class to calculate distance per timeout (currently 1s)
    - [X] Speed value from HomeSpeed.qml is able to be passed to Timer C++ class
    - [X] QML component to display distance travelled
    - [X] Register QML type for Timer C++ class
    - [X] Timer C++ class created to calculate distance

- [X] HomeSpeed.qml
    - [ ] RPM gauge: increases the "random" oscillation as speed increases
    - [ ] Improve UI for engine start/stop
    - [ ] Improve UI for accelerate, brake pedals
    - [X] Added Engine Start / Engine Stop Button
    - [X] Add button to increase speed and decrease speed
    - [X] Linear speed acceleration / deceleration over time

- [ ] HomeFuelGauge.qml
    - [X] Add functionality to refill fuel gauge
- [ ] Add temperature monitoring
- [ ] Disable accelerate / brake pedals when engine start is OFF
- [X] HomeWelcome.qml
    - [X] Make a Label: "Welcome User"

- [X] HomeGear.qml
    - [X] Gear Display (changes based on speed)

- [X] HomeSaveLoad.qml
    - [X] Button to save vehicle configuration into json format
        - currently only saves distance information
    - [X] Button to load vehicle configuration from json format

#### AUDIO PAGE
- [ ] Play Button
- [ ] Pause Button
- [ ] Stop Button
- [ ] Resume Button
- [ ] Track play progress bar (Utilization of C++ Timer class)
- [ ] Volume Control

Testing
- [X] Create testing components to save to JSON [in Audio.qml]
    - Current testing saves json file on Desktop



*** Important notes ***
- When creating C++ objects in QML files, try to create them in the parent page (dependent on scenario)
    - If a class is instantiated as an object in the child page, be aware that in another QML file, it could be instantiated as a different object.
