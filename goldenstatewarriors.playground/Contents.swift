//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//: Playground - noun: a place where people can play

import UIKit


/*
 public struct Pixel {
 public var value: UInt32
 
 public var red: UInt8 {
 get {
 return UInt8(value & 0xFF)
 }
 set {
 value = UInt32(newValue) | (value & 0xFFFFFF00)
 }
 }
 
 public var green: UInt8 {
 get {
 return UInt8((value >> 8) & 0xFF)
 }
 set {
 value = (UInt32(newValue) << 8) | (value & 0xFFFF00FF)
 }
 }
 
 public var blue: UInt8 {
 get {
 return UInt8((value >> 16) & 0xFF)
 }
 set {
 value = (UInt32(newValue) << 16) | (value & 0xFF00FFFF)
 }
 }
 
 public var alpha: UInt8 {
 get {
 return UInt8((value >> 24) & 0xFF)
 }
 set {
 value = (UInt32(newValue) << 24) | (value & 0x00FFFFFF)
 }
 }
 }
 
 public struct RGBAImage {
 public var pixels: UnsafeMutableBufferPointer<Pixel>
 
 public var width: Int
 public var height: Int
 
 public init?(image: UIImage) {
 guard let cgImage = image.CGImage else { return nil }
 
 // Redraw image for correct pixel format
 let colorSpace = CGColorSpaceCreateDeviceRGB()
 
 var bitmapInfo: UInt32 = CGBitmapInfo.ByteOrder32Big.rawValue
 bitmapInfo |= CGImageAlphaInfo.PremultipliedLast.rawValue & CGBitmapInfo.AlphaInfoMask.rawValue
 
 width = Int(image.size.width)
 height = Int(image.size.height)
 let bytesPerRow = width * 4
 
 let imageData = UnsafeMutablePointer<Pixel>.alloc(width * height)
 
 guard let imageContext = CGBitmapContextCreate(imageData, width, height, 8, bytesPerRow, colorSpace, bitmapInfo) else { return nil }
 CGContextDrawImage(imageContext, CGRect(origin: CGPointZero, size: image.size), cgImage)
 
 pixels = UnsafeMutableBufferPointer<Pixel>(start: imageData, count: width * height)
 }
 
 public func toUIImage() -> UIImage? {
 let colorSpace = CGColorSpaceCreateDeviceRGB()
 var bitmapInfo: UInt32 = CGBitmapInfo.ByteOrder32Big.rawValue
 bitmapInfo |= CGImageAlphaInfo.PremultipliedLast.rawValue & CGBitmapInfo.AlphaInfoMask.rawValue
 
 let bytesPerRow = width * 4
 
 let imageContext = CGBitmapContextCreateWithData(pixels.baseAddress, width, height, 8, bytesPerRow, colorSpace, bitmapInfo, nil, nil)
 
 guard let cgImage = CGBitmapContextCreateImage(imageContext) else {return nil}
 let image = UIImage(CGImage: cgImage)
 
 return image
 }
 }
 */


let image = UIImage(named: "sample")!
let myRGBA = RGBAImage(image: image )!

class myImageProcessor {
    var myRGBA: RGBAImage
    
    init(name: String) {
        let image = UIImage(named: name)!
        self.myRGBA = RGBAImage(image: image)!
    }
    
    func applySomeFilters(filter:String) -> UIImage {
        let copyImageRed:RGBAImage = self.myRGBA
        let copyImageTrans:RGBAImage = self.myRGBA
        let copyImageBlue:RGBAImage = self.myRGBA
        let copyImageGreen:RGBAImage = self.myRGBA
        let copyImageYellow:RGBAImage = self.myRGBA
        
        
        switch(filter) {
        case "IncreaseTransparency %100":
            for y in 0..<copyImageTrans.width {
                for x in 0..<copyImageTrans.height {
                    let index = y*copyImageTrans.width+x
                    var pixel = copyImageTrans.pixels[index]
                    pixel.alpha = UInt8(Int(pixel.alpha)/2)
                    copyImageTrans.pixels[index] = pixel
                    
                }
            }
        case "IncreaseRed %100":
            for y in 0..<copyImageRed.width {
                for x in 0..<copyImageRed.height {
                    let index = y*copyImageRed.width+x
                    var pixel = copyImageRed.pixels[index]
                    pixel.red = UInt8(max(0, min(255, Int(pixel.red)*2)))
                    copyImageRed.pixels[index] = pixel
                    
                }
            }
        case "IncreaseBlue %100":
            for y in 0..<copyImageBlue.width {
                for x in 0..<copyImageBlue.height {
                    let index = y*copyImageBlue.width+x
                    var pixel = copyImageBlue.pixels[index]
                    pixel.blue = UInt8(max(0, min(255, Int(pixel.blue)*4)))
                    //pixel.blue = 255
                    copyImageBlue.pixels[index] = pixel
                    
                    
                    
                }
            }
        case "IncreaseGreen %100":
            for y in 0..<copyImageGreen.width {
                for x in 0..<copyImageGreen.height {
                    let index = y*copyImageGreen.width+x
                    var pixel = copyImageGreen.pixels[index]
                    pixel.green = UInt8(max(0, min(255, Int(pixel.green)*5)))
                    //pixel.green=255
                    copyImageGreen.pixels[index] = pixel
                    
                    
                }
            }
            
            
            
        default:
            copyImageTrans.toUIImage()
            copyImageRed.toUIImage()
            copyImageBlue.toUIImage()
            copyImageGreen.toUIImage()
            copyImageYellow.toUIImage()
        }
        
        return copyImageTrans.toUIImage()!
        return copyImageRed.toUIImage()!
        return copyImageGreen.toUIImage()!
        return copyImageYellow.toUIImage()!
    }
}

var myImageProcessor1 = myImageProcessor(name: "sample")
myImageProcessor1.myRGBA.toUIImage()
//myImageProcessor.applySomeFilters(["IncreaseTransparency %100"])

//myImageProcessor.applySomeFilters(["IncreaseBlue %100"])



myImageProcessor1.applySomeFilters("IncreaseGreen %100")
myImageProcessor1.applySomeFilters("IncreaseRed %100")



//: Playground - noun: a place where people can play












