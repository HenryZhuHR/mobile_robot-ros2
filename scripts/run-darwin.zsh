export DEFAULT=$(echo -en '\033[0m')
export LGREEN=$(echo -en '\033[01;32m')
export LYELLOW=$(echo -en '\033[01;33m')
export LRED=$(echo -en '\033[01;31m')

script_dir=$(cd $(dirname $0); pwd)

source $script_dir/env/constant.sh

export WORKSPACE=$PWD
echo "work dir ${WORKSPACE}"
cd $WORKSPACE

# rm -rf build install log

export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:"$WORKSPACE/libs/jsoncpp/"
# export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:"$WORKSPACE/libs/paho-mqtt/lib/cmake/eclipse-paho-mqtt-c"
# export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:"$WORKSPACE/libs/paho-mqtt/lib/cmake/PahoMqttCpp"
# export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:"$WORKSPACE/libs/serial/share/serial/cmake"


BUILD_LIST=(
    # 接口
    state_interfaces # 系统状态接口

    # 通用功能包
    system_state # 系统状态
    base_node # 基本节点
    
    # 系统控制

    system_manager # 系统管理
    motion_manager # 运动控制管理(包括底层数据收集)

    # dt_mqtt_py # 数据传输
    # dt_rtmp_py # 视频流数据


    
    # video_streamer_cpp # 视频流
    # sensor_uwb_py     # uwb 数据采集功能
    # vision_lanedet_py     # 视觉 车道线检测
    controller_py
    roslaunch
)
for item in ${BUILD_LIST[@]}; do
    echo ""
    echo "${LGREEN}Build: ${item}${DEFAULT}"
    colcon build --packages-select ${item} \
        --symlink-install \
        --cmake-args \
            -DCMAKE_BUILD_TYPE=Debug \
            -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
    source install/setup.zsh
done

# which python
ext_python_path=$(python -c 'import site; print(":".join(site.getsitepackages()))')
export PYTHONPATH=$PYTHONPATH:$ext_python_path

source install/setup.zsh

# ros2 launch roslaunch car.launch.py
# ros2 run system_manager system_manager
# ros2 run dt_mqtt_py dt_mqtt
# ros2 run motion_manager motion_manager_node




# ros2 run sensor_uwb_py sensor_uwb

