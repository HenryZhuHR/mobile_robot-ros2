cmake_minimum_required(VERSION 3.20)
project(state_interfaces)

# Default to C99
if(NOT CMAKE_C_STANDARD)
  set(CMAKE_C_STANDARD 99)
endif()

# Default to C++17
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()


# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(std_msgs REQUIRED)# 消息依赖
# find_package(sensor_msgs REQUIRED)# 消息依赖


rosidl_generate_interfaces(${PROJECT_NAME}
  # -- 消息
  "msg/SystemState.msg" # 系统状态
  # 传感器数据
  "msg/Gyroscope.msg" # 陀螺仪数据
  "msg/Acceleration.msg" # 加速度计数据
  "msg/Attitude.msg" # 加速度计数据
  "msg/Imu6Axis.msg" # 6轴IMU数据
  "msg/Odometry.msg" # 里程计数据
  # 车辆状态
  "msg/Speed.msg" # 系统状态


  # -- 服务
  "srv/UpdateState.srv" # 更新状态
  DEPENDENCIES std_msgs
)


ament_export_dependencies(rosidl_default_runtime)

ament_package()
