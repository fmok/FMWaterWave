# FMWaterWave
CADisplayLink &amp; CAShapeLayer 

1、CADisplayLink
2、UIBezierPath
3、CAShapeLayer
4、mask

以正弦曲线为例，它可以表示为y=Asin(ωx+φ)+k，公式中各符号表示的含义：

A–振幅，即波峰的高度。
(ωx+φ)–相位，反应了变量y所处的位置。
φ–初相，x=0时的相位，反映在坐标系上则为图像的左右移动。
k–偏距，反映在坐标系上则为图像的上移或下移。
ω–角速度，控制正弦周期(单位角度内震动的次数)。

绘制正弦函数
- (UIBezierPath *)createSinPath
{
    UIBezierPath *wavePath = [UIBezierPath bezierPath];
    CGFloat endX = 0;
    for (CGFloat x = 0; x < self.waveWidth + 1; x += 1) {
        endX=x;
        CGFloat y = self.maxAmplitude * sinf(360.0 / _waveWidth * (x  * M_PI / 180) * self.frequency + self.phase * M_PI/ 180) + self.maxAmplitude;
        if (x == 0) {
            [wavePath moveToPoint:CGPointMake(x, y)];
        } else {
            [wavePath addLineToPoint:CGPointMake(x, y)];
        }
    }

    CGFloat endY = CGRectGetHeight(self.bounds) + 10;
    [wavePath addLineToPoint:CGPointMake(endX, endY)];
    [wavePath addLineToPoint:CGPointMake(0, endY)];

    return wavePath;
}

让正弦函数动起来
- (void)startLoading
{
    [_displayLink invalidate];
    self.displayLink = [CADisplayLink displayLinkWithTarget:self
        selector:@selector(updateWave:)];
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)updateWave:(CADisplayLink *)displayLink
{
    self.phase += 8;//逐渐累加初相
    self.waveSinLayer.path = [self createSinPath].CGPath;
}

- (UIBezierPath *)createSinPath
{
    UIBezierPath *wavePath = [UIBezierPath bezierPath];
    CGFloat endX = 0;
    for (CGFloat x = 0; x < self.waveWidth + 1; x += 1) {
        endX=x;
        CGFloat y = self.maxAmplitude * sinf(360.0 / _waveWidth * (x  * M_PI / 180) * self.frequency + self.phase * M_PI/ 180) + self.maxAmplitude;
        if (x == 0) {
            [wavePath moveToPoint:CGPointMake(x, y)];
        } else {
            [wavePath addLineToPoint:CGPointMake(x, y)];
        }
    }

    CGFloat endY = CGRectGetHeight(self.bounds) + 10;
    [wavePath addLineToPoint:CGPointMake(endX, endY)];
    [wavePath addLineToPoint:CGPointMake(0, endY)];

    return wavePath;
}
