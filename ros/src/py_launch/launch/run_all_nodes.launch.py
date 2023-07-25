from launch import LaunchDescription
from launch_ros.actions import Node

import platform


def generate_launch_description():
    node_list = []
    video_reader = Node(package="py_video_streamer", executable="video_reader", name="t1")
    video_viewer = Node(package="py_video_streamer", executable="video_viewer", name="t1")

    cpp_video_reader = Node(
        package="cpp_video_streamer",
        executable="video_reader",
        name="t1",
        parameters=[{
            "source": "weights/test.mp4", # camera or file/url
        }],
    )
    cpp_video_viewer = Node(
        package="cpp_video_streamer",
        executable="video_viewer",
        name="t1",
    )

    vision_lanedet_node = Node(
        package="vision_lanedet_py",
        executable="lanedet_ros",
        name="vision_lanedet_py",
    )

    return LaunchDescription([
        cpp_video_reader,
        cpp_video_viewer,
        vision_lanedet_node,
    ])