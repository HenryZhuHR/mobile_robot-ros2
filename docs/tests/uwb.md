# uwb.py user guide

目录: `tests/uwb.py`

# 🍽️ 准备工作

### 导入uwb.py

- 需要安装pyserial

# 📦 功能包
## PC端初始化串口📦
### def uwb_ser_init(port="COM12", baud_rate=115200):
### return ser
- 从设备管理器查看COM端口
- 波特率默认为115200
- 返回串口句柄

## 关闭串口📦
### def uwb_ser_close(ser)
- ser就是刚才初始化后得到的串口句柄

## 串口得到uwb传回的原始有效数据📦
### def uwb_get_valid_data(ser, verbose=False):
### return return X, Y, Z, DA, DB, DC, DD
- verbose打开会回传串口接收到的数据，16进制显示
- 返回X，Y，Z二维定位坐标值，DA，DB，DC，DD是距离4个基站的距离

## 得到滤波后的稳定坐标值📦
### def uwb_get_loc(ser, ave_cap=10, filter_size=2):
### return xyz_ave
- ave_cap是一次性要处理的从串口接收并存储的数据容量，如果过大会有延时效应
- filter_size是滤波核的大小，一般要小于ave_cap/2
- 返回的是一个列表xyz_ave = [x_coor, y_coor, z_coor]
