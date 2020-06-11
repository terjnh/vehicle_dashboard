# Vehicle Dashboard
</br>

## UI build for a vehicle dashboard (SwipeView)

Written in Qt, QML and C++
</br>
</br>

### TO-DO

HOME PAGE
- [ ] Distance meter
    - [ ] Update QML component in HomeDistance.qml to reflect calculated distance per timeout (Distance meter in UI to update every second)
    - [ ] Use speed value in Timer C++ class to calculate distance per timeout (currently 1s)
    - [X] Speed value from HomeSpeed.qml is able to be passed to Timer C++ class
    - [X] QML component to display distance travelled
    - [X] Register QML type for Timer C++ class
    - [X] Timer C++ class created to calculate distance
- [ ] RPM gauge: increases the "random" oscillation as speed increases
- [ ] Add temperature monitoring
- [X] Make a Label: "Welcome User"
- [X] Add functionality to refill fuel gauge
- [X] Add speed dial
- [X] Add RPM dial
- [X] Add button to increase speed and decrease speed
- [X] Linear speed acceleration / deceleration over time
- [X] Gear Display (changes based on speed)

AUDIO PAGE
- [ ] Play Button
- [ ] Pause Button
- [ ] Stop Button
- [ ] Resume Button
- [ ] Track play progress bar (Utilization of C++ Timer class)
- [ ] Volume Control

Testing
- [X] Create testing components to save to JSON [in Audio.qml]
    - Current testing saves json file on Desktop
