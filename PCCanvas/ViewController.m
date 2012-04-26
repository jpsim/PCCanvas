//
//  ViewController.m
//  PCCanvas
//
//  Created by Jean-Pierre Simard on 12-04-12.
//  Copyright (c) 2012 Magnetic Bear Studios. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+BBlock.h"

//CANVAS SIZE
#define CANVAS_WIDTH 240
#define CANVAS_HEIGHT 120

//MASK SIZE
#define MASK_WIDTH 8
#define MASK_HEIGHT 8

#define tag_length 200

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImageView *canvasImageView = [[UIImageView alloc] initWithImage:[self drawCanvas]];
    canvasImageView.frame = CGRectMake((self.view.frame.size.width - canvasImageView.frame.size.width)/2, (self.view.frame.size.height - canvasImageView.frame.size.height)/2, canvasImageView.frame.size.width, canvasImageView.frame.size.height);
    [self.view addSubview:canvasImageView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (UIImage *)drawCanvas{
    return [UIImage imageForSize:CGSizeMake(CANVAS_WIDTH, CANVAS_HEIGHT) withDrawingBlock:^{
        //// General Declarations
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        //// Color Declarations
        UIColor* dBlue = [UIColor colorWithRed: 0.22 green: 0.51 blue: 0.72 alpha: 1];
        UIColor* lBlue = [UIColor colorWithRed: 0.54 green: 0.79 blue: 0.93 alpha: 1];
        
        //// Gradient Declarations
        NSArray* gradientColors = [NSArray arrayWithObjects:
                                   (id)lBlue.CGColor,
                                   (id)[UIColor colorWithRed: 0.39 green: 0.66 blue: 0.83 alpha: 1].CGColor,
                                   (id)dBlue.CGColor, nil];
        CGFloat gradientLocations[] = {0, 0.3, 0.8};
        CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)gradientColors, gradientLocations);
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(11.26, 27.26)];
        [bezier2Path addCurveToPoint: CGPointMake(11.26, 35.74) controlPoint1: CGPointMake(8.91, 29.6) controlPoint2: CGPointMake(8.91, 33.4)];
        [bezier2Path addCurveToPoint: CGPointMake(19.74, 35.74) controlPoint1: CGPointMake(13.6, 38.09) controlPoint2: CGPointMake(17.4, 38.09)];
        [bezier2Path addCurveToPoint: CGPointMake(19.74, 27.26) controlPoint1: CGPointMake(22.09, 33.4) controlPoint2: CGPointMake(22.09, 29.6)];
        [bezier2Path addCurveToPoint: CGPointMake(11.26, 27.26) controlPoint1: CGPointMake(17.4, 24.91) controlPoint2: CGPointMake(13.6, 24.91)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(26.91+tag_length, 5.5)];
        [bezier2Path addCurveToPoint: CGPointMake(34.5+tag_length, 14) controlPoint1: CGPointMake(30.92+tag_length, 5.49) controlPoint2: CGPointMake(34.5+tag_length, 9.58)];
        [bezier2Path addLineToPoint: CGPointMake(34.5+tag_length, 49.5)];
        [bezier2Path addCurveToPoint: CGPointMake(27+tag_length, 57.5) controlPoint1: CGPointMake(34.5+tag_length, 53.92) controlPoint2: CGPointMake(31.42+tag_length, 57.5)];
        [bezier2Path addLineToPoint: CGPointMake(25.5, 57.5)];
        [bezier2Path addCurveToPoint: CGPointMake(4.5, 40.5) controlPoint1: CGPointMake(21.08, 57.5) controlPoint2: CGPointMake(5.02, 44.87)];
        [bezier2Path addLineToPoint: CGPointMake(4.5, 22.5)];
        [bezier2Path addCurveToPoint: CGPointMake(25.5, 5.5) controlPoint1: CGPointMake(4.91, 18.02) controlPoint2: CGPointMake(21.08, 5.5)];
        [bezier2Path addLineToPoint: CGPointMake(26.91+tag_length, 5.5)];
        [bezier2Path closePath];
        CGContextSaveGState(context);
        [bezier2Path addClip];
        CGContextDrawLinearGradient(context, gradient, CGPointMake(19.5+(tag_length/2), 5.5), CGPointMake(19.5+(tag_length/2), 57.5), 0);
        CGContextRestoreGState(context);
        
        [dBlue setStroke];
        bezier2Path.lineWidth = 2;
        [bezier2Path stroke];
        
        //// Cleanup
        CGGradientRelease(gradient);
        CGColorSpaceRelease(colorSpace);
//        END PASTE
    }];
}

@end