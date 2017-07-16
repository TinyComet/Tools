//: Playground - noun: a place where people can play

import Cocoa

let rootDirPath = "/Users/xxx/git/"
let outputPath = "/Users/xxx/"
let manager = FileManager.default


var fileList :[String] = []
var fileNames: [String]{
	do{
		return try manager.contentsOfDirectory(atPath: rootDirPath)
	}catch{
		return []
	}
}

if(fileNames.count != 0){

	var dirlist: [String] = []
	fileNames.forEach{
		let currentDirPath = rootDirPath  + $0
		var isDir : ObjCBool = false
		if(manager.fileExists(atPath: currentDirPath, isDirectory: &isDir)){
			if isDir.boolValue{
				// directory
				dirlist.append(currentDirPath)
			}else{
				// file
				print(currentDirPath.replacingOccurrences(of: rootDirPath, with: ""))
				//fileList.append(currentDirPath.replacingOccurrences(of: rootDirPath, with: ""))
			}
		}
	}
	dirlist.forEach{
		printFile(path: $0)
	}
}

func printFile(path: String){
	var _fileNames: [String]{
		do{
			return try manager.contentsOfDirectory(atPath: path)
		}catch{
			return []
		}
	}
	if(_fileNames.count != 0){

		var list: [String] = []
		_fileNames.forEach{
			let tmp = path + "/" + $0
			var isDir : ObjCBool = false
			if(manager.fileExists(atPath: tmp, isDirectory: &isDir)){
				if isDir.boolValue{
					// directory
					list.append(tmp)
				}else{
					// file
					print(tmp.replacingOccurrences(of: rootDirPath, with: ""))
					//fileList.append(tmp.replacingOccurrences(of: rootDirPath, with: ""))
				}
			}
		}
		list.forEach{
			printFile(path: $0)
		}
	}
}

