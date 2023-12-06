# <br>代码规范

## 函数命名和调用

- 主程序和被外部调用的函数和变量，一律使用lowerCamelCase命名格式。例如：
  
   - `startupScreen()`

   - `initializeEverything()`

   - `highestTemperature`

- 仅被本文件调用的函数和变量，可以随意, 建议使用 `__` 开头, 例如:

   - `__writeComOnLCD1602()`
  
   - `__writeDataOnLCD1602()`
  
   - `__writeByteToDS18B20()`

- 主程序以外的文件, 使用全局变量或传递指针调用, 全局变量和传递指针的使用原则为:
  
  1. 只被读取或调用的变量或函数, 采用全局变量 `extern` 关键字声明, 例如:

   - `extern void initializeFan();`

  2. 需要修改变量内容的位置, 采用传递指针调用, 例如: 
   
   - `void writeAT24C02(unsigned char addr, unsigned char dat);`

# <br>引脚/地址定义

|变量|引脚/地址|功能|备注|
|:-:|:-:|:-:|:-:|
|SETTING_BUTTON|P3^7|设置按钮|S1键|
|ADD_BUTTON|P3^6|加按钮|S2键|
|SUB_BUTTON|P3^5|减按钮|S3键|
|APPLY_BUTTON|P3^4|应用按钮|S4键|
|RST_BUTTON|P3^3|复位按钮|S5键|
|DEBUG_BUTTON|P3^2|调试按钮|S6键|
|BEEP|P1^4|蜂鸣器|-|
|LED|P2^0|LED灯|单片机上D7位置的LED灯|
|FAN|P2^7|风扇|使用时注意跳线|
|DSPORT|P1^5|DS18B20数据线|DS18B20内部变量|
|SCL|P1^6|I2C时钟线|AT24C02内部变量|
|SDA|P1^7|I2C数据线|AT24C02内部变量|
|LCD1602_E|P1^2|LCD1602使能线|LCD1602内部变量|
|LCD1602_RW|P1^1|LCD1602读/写选择线|LCD1602内部变量|
|LCD1602_RS|P1^0|LCD1602寄存器选择线|LCD1602内部变量|
|AT24C02_ADD|0xA0|AT24C02设备地址|AT24C02内部变量|

# <br><br>主程序

- main.c

#### 全局变量

- `SETTING_BUTTON`，`ADD_BUTTON`，`SUB_BUTTON`，`APPLY_BUTTON`，`RST_BUTTON`，`DEBUG_BUTTON`，`BEEP`，`LED`，`FAN`：这些是连接到P3和P1、P2端口的各种按钮和设备的引脚。

- `TH_INIT`，`TL_INIT`：定时器初值。

- `fanLevel`：风扇档位，0档: 0%转速，1档: 50%转速, 2档: 75%转速, 3档: 100%转速。

- `fanState`：用于控制风扇转速（0: 关闭, 1: 打开）。

- `currentTemperature`：当前温度。

- `highestTemperature`，`lowestTemperature`：最高和最低温度。

- `firstLine`，`secondLine`：用于在屏幕上显示的字符数组。

- `onScreenHighestTemperature`，`onScreenLowestTemperature`，`onScreenCurrentTemperature`，`onScreenFanLevel`：指向屏幕上显示的各种温度和风扇档位的指针。

#### 主函数

- `main()`：程序的入口点。初始化所有设备，显示启动屏幕，然后进入主循环。在主循环中，检查复位按钮是否被按下，如果是，则重置最高和最低温度。

# <br><br>屏幕

## <br>开机启动屏幕

- startupScreen.c

#### 函数

- `startupScreen()`：显示开机画面。首先定义两行字符，然后逐个显示这两行字符，每显示一个字符后延时50毫秒，显示完所有字符后延时1秒，然后将所有字符向左移动一格，最后一格改为空格，每移动一格后延时25毫秒，直到所有字符都移出屏幕。这个函数没有输入参数和返回值。

#### 注意事项

- 在使用这个函数时，需要确保LCD1602已经正确连接到相应的端口，并且`putStringOnLCD1602`和`writeCharOnLCD1602`函数已经被正确实现。

## <br>主屏幕

- mainScreen.c

#### 全局变量

- `LED`，`BEEP`：LED灯和蜂鸣器连接的端口。

- `fanLevel`：风扇的档位。

- `fanState[4]`：风扇的状态数组，每个元素代表一个PWM占空比。

- `currentTemperature`：当前温度。

- `highestTemperature`，`lowestTemperature`：存储的最高温度和最低温度。

- `onScreenHighestTemperature`，`onScreenLowestTemperature`，`onScreenCurrentTemperature`，`onScreenFanLevel`：显示在屏幕上的最高温度，最低温度，当前温度和风扇档位。

- `firstLine[]`，`secondLine[]`：显示在屏幕上的第一行和第二行的字符。

#### 函数

- `mainScreen()`：显示主屏幕。首先处理存储的最高温度和最低温度，然后处理当前温度，然后处理风扇档位，然后根据当前温度设置LED灯的状态，然后根据当前温度设置蜂鸣器的状态，然后根据当前温度设置风扇的状态。这个函数没有输入参数和返回值。

#### 注意事项

- 在使用这个函数时，需要确保LED灯，蜂鸣器，风扇，DS18B20，AT24C02和LCD1602已经正确连接到相应的端口，并且所有设备的初始化函数和操作函数已经被正确实现。

## <br>设置屏幕

- settingScreen.c

#### 全局变量

- `SETTING_BUTTON`，`ADD_BUTTON`，`SUB_BUTTON`，`APPLY_BUTTON`，`RST_BUTTON`，`DEBUG_BUTTON`：各种按钮连接的端口。

- `highestTemperature`，`lowestTemperature`：存储的最高温度和最低温度。

- `onScreenHighestTemperature`，`onScreenLowestTemperature`：显示在屏幕上的最高温度和最低温度。

- `firstLine[]`，`secondLine[]`：显示在屏幕上的第一行和第二行的字符。

#### 函数

- `settingScreen()`：显示设置屏幕。首先等待按键释放，然后显示"Setting..."，然后进入一个循环，如果按下APPLY_BUTTON则退出循环，如果光标位置发生变化，则重新显示屏幕画面，如果再次按下SETTING_BUTTON则切换光标位置。这个函数没有输入参数和返回值。

#### 注意事项

- 在使用这个函数时，需要确保所有按钮，AT24C02和LCD1602已经正确连接到相应的端口，并且所有设备的初始化函数和操作函数已经被正确实现。

## <br>消息屏幕

- alartScreen.c

#### 函数

- `alartScreen(unsigned char text[])`：显示警告屏幕。首先清屏，然后计算居中位置，然后显示字符串，最后延时300毫秒。这个函数的输入参数是要显示的字符串，没有返回值。

#### 注意事项

- 在使用这个函数时，需要确保LCD1602已经正确连接到相应的端口，并且`clearLineInLCD1602`和`putStringOnLCD1602`函数已经被正确实现。

# <br><br>组件函数

## <br>AT24C02 EEPROM

- AT24C02.c

#### 内部变量

- `AT24C02_ADD`：AT24C02的设备地址。

#### 函数

- `writeAT24C02(unsigned char addr, unsigned char dat)`：向AT24C02的一个地址写入一个数据。地址范围为0x00-0xFF。写入数据后，会有300毫秒的延迟。

- `readAT24C02(unsigned char addr)`：读取AT24C02的一个地址的数据。地址范围为0x00-0xFF。读取数据后，会有300毫秒的延迟。

#### 注意事项

- 在向AT24C02写入数据时，不能写的太快，需要加一个延迟。经测试，1秒的延迟是稳定的，可以尝试调整参数以提高频率。

#### 延时函数

- DELAY.c

#### 函数

- `delayOneMillisecond(unsigned int n)`：延时n毫秒，误差5%。这个函数使用了一个简单的for循环来实现延时。

- `delayOneSecond(unsigned int n)`：延时n秒，误差5%。这个函数通过调用`delayOneMillisecond(1000)` n次来实现延时。

- `delayTenMicroseconds(unsigned int n)`：延时n*10微秒，误差80%。这个函数使用了一个while循环来实现延时。

#### 注意事项

- 这些延时函数的误差较大，特别是`delayTenMicroseconds(unsigned int n)`函数，误差高达80%。在需要精确延时的场合，可能需要使用其他方法。

## <br>DS18B20温度传感器

- DS18B20.c

#### 内部变量

- `DSPORT`：DS18B20的数据线连接的端口。

#### 函数

- `initializeDS18B20(void)`：初始化DS18B20。首先将总线拉低480us~960us，然后释放总线，等待DS18B20将总线拉低。如果DS18B20在5ms内没有反应，则初始化失败，返回0。否则，初始化成功，返回1。

- `writeByteToDS18B20(unsigned char dat)`：向DS18B20写入一个字节的数据。每写入一位数据之前，先将总线拉低1us，然后写入数据，从最低位开始。写入数据后，延时68us，然后释放总线，至少1us给总线恢复时间才能接着写入下一个数据。

- `readByteFromDS18B20(void)`：从DS18B20读取一个字节的数据。这个函数的实现在代码的下一部分。

#### 注意事项

- 在使用这些函数时，需要确保DS18B20的数据线已经正确连接到`DSPORT`所代表的端口。

## <br>PWM风扇

- FAN_PWM.c

#### 全局变量

- `FAN`：风扇连接的端口。

- `fanState[4]`：风扇的状态数组，每个元素代表一个PWM占空比。

- `TH_INIT`，`TL_INIT`：定时器初值。

#### 函数

- `initializeFan()`：初始化风扇和定时器0。首先关闭风扇，然后设置定时器0的模式和初值，清除TF0标志，开始定时器0的计时，使能定时器0中断，开启总中断。这个函数没有输入参数和返回值。

- `PWM() interrupt 1`：定时器0的中断服务程序。每次中断，都会重新设置定时器初值，然后根据`fanState[i%4]`设置风扇的状态。`i`是一个静态变量，每次中断都会增加1，当`i`达到100时，将`i`重置为0。这个函数没有输入参数和返回值。

#### 注意事项

- 在使用这些函数时，需要确保风扇已经正确连接到`FAN`所代表的端口，并且`fanState`数组已经被正确初始化。

## <br>IIC总线

- IIC.c

#### 内部变量

- `SCL`，`SDA`：I2C的时钟线和数据线连接的端口。

#### 函数

- `startIIC(void)`：发送I2C起始信号。首先将SDA和SCL拉高，然后将SDA拉低，最后将SCL拉低。每个步骤之间有一个延时。这个函数没有输入参数和返回值。

- `stopIIC(void)`：发送I2C终止信号。首先将SDA拉低，然后将SCL拉高，最后将SDA拉高。每个步骤之间有一个延时。这个函数没有输入参数和返回值。

- `sendByteToIIC(unsigned char dat)`：通过I2C发送一个字节的数据。首先将SDA设置为数据的最高位，然后将数据左移一位，然后将SCL拉高，最后将SCL拉低。这个过程重复8次，发送完一个字节的数据。发送完数据后，将SDA拉高。这个函数的输入参数是要发送的数据，返回值是1。

#### 注意事项

- 在使用这些函数时，需要确保I2C的时钟线和数据线已经正确连接到`SCL`和`SDA`所代表的端口。

## <br>LCD1602显示屏

- LCD1602.c

#### 内部变量

- `LCD1602_DATAPINS`：LCD1602的数据线连接的端口。

- `LCD1602_E`，`LCD1602_RW`，`LCD1602_RS`：LCD1602的使能线，读/写选择线，寄存器选择线连接的端口。

#### 函数

- `__writeComOnLCD1602(unsigned char com)`：向LCD1602写入一个命令。首先将使能线拉低，选择发送命令，选择写入，然后将命令放入数据线，等待数据稳定，然后将使能线拉高，保持一段时间，最后将使能线拉低。这个函数的输入参数是要写入的命令，没有返回值。

- `__writeDataOnLCD1602(unsigned char dat)`：向LCD1602写入一个字节的数据。首先将使能线拉低，选择输入数据，选择写入，然后将数据放入数据线，等待数据稳定，然后将使能线拉高，保持一段时间，最后将使能线拉低。这个函数的输入参数是要写入的数据，没有返回值。

- `initializeLCD1602(void)`：初始化LCD1602。首先开显示，然后开显示不显示光标，然后写一个指针加1，然后清屏，最后设置数据指针起点。这个函数没有输入参数和返回值。

- `clearLineInLCD1602(unsigned char row)`：清除LCD1602的第0行或第1行的数据。这个函数的输入参数是要清除的行号，没有返回值。

#### 注意事项

- 在使用这些函数时，需要确保LCD1602的数据线，使能线，读/写选择线，寄存器选择线已经正确连接到相应的端口。

## <br>蜂鸣器

- BEEP.c

#### 内部变量

- `H4_`，`H5`，`H5_`，`H6`，`H6_`，`H7`：音符的频率索引。

- `FreqTable`：频率表，索引与频率对照表。

- `Music`：乐谱，音符与索引对应表，P：休止符，L：低音，M：中音，H：高音，下划线：升半音符号。

#### 函数

- `initializeBeep()`：初始化蜂鸣器。首先关闭蜂鸣器，然后设置定时器1的模式和初值，清除TF1标志，开始定时器1的计时，使能定时器1中断，开启总中断。这个函数没有输入参数和返回值。

- `playMusic(unsigned char *music)`：播放乐谱。首先关闭蜂鸣器，然后设置定时器1的模式和初值，清除TF1标志，开始定时器1的计时，使能定时器1中断，开启总中断，然后根据乐谱设置定时器1的初值和蜂鸣器的状态。这个函数的输入参数是乐谱，没有返回值。

#### 注意事项

- 在使用这些函数时，需要确保蜂鸣器已经正确连接到相应的端口，并且`FreqTable`和`Music`已经被正确初始化。

## <br>其他功能

- FUNCTIONS.c

#### 函数

- `initializeEverything()`：初始化所有设备。首先关闭蜂鸣器，风扇和LED，然后初始化风扇，LCD1602和DS18B20。这个函数没有输入参数和返回值。

#### 注意事项

- 在使用这个函数时，需要确保所有设备已经正确连接到相应的端口，并且所有设备的初始化函数已经被正确实现。