//
//  main.swift
//  DaftarBuah
//
//  Created by Michael Varian Sutanto on 21/04/20.
//  Copyright © 2020 Dicoding Indonesia. All rights reserved.
//

import Foundation
 
var listFruits = [String]()
var isRunning = true
 
// Pada kode ini, Anda melakukan dua pekerjaan yakni menampilkan pesan dan mendapatkan nilai balikan berupa inputan dari pengguna. Pemanggilan getInput sama seperti pemanggilan readLine pada umumnya, yang membedakan adalah ketika mendapatkan input terdapat parameter message yang akan ditampilkan di console.

func getInput(message: String) -> String?{
    print(message, terminator: ": ");
    return readLine()
}
 
// Nah pada function getInputInt, kita memanggil getInput kemudian mengubahnya menjadi int? dan mengirimkan nilai balikan kepada siapa saja yang memanggilnya.

func getInputInt(message: String) -> Int?{
    if let inputString = getInput(message: message){
        return Int(inputString)
    } else{
        return nil
    }
}


// func showAllFruits digunakan untuk menampilkan semua data array buah yang ada. Jika tidak ada data maka akan mengembalikan pesan “Belum ada item di dalam daftar”.

func showAllFruits(){
    if listFruits.isEmpty {
        print("Belum ada item di dalam daftar")
    }else{
        for (index, value) in listFruits.enumerated() {
            print("[\(index + 1)] \(value)")
        }
    }
}
 
// function insertFruit memanggil function lain dan melakukan optional binding untuk mendapatkan nilai literal string. Nilai yang didapatkan nantinya akan dimasukkan ke dalam array buah dengan perintah append.
 
func insertFruit(){
    if let name = getInput(message: "Masukkan nama buah") {
        listFruits.append(name)
    }else{
        insertFruit()
        print("Input tidak valid")
    }
}

// Sebelum mengubah data buah Anda perlu mengetahui posisi dari item buah yang akan diubah. Untuk mendapatkan posisi dari item yang dipilih, function editFruit memanggil function lain yakni getInput.
 
func editFruit(){
    showAllFruits()
    print("----------------------------------")
    if let position = getInputInt(message: "Pilih posisi buah yang akan diganti"), position<=listFruits.count && position>0, let name = getInput(message: "Masukkan nama buah") {
        listFruits[position-1] = name
    }else{
        editFruit()
        print("Input tidak valid")
    }
}
 
// Sebelum menghapus data buah Anda perlu mengetahui posisi dari item buah yang akan diubah. Untuk mendapatkan posisi dari item yang dipilih, function deleteFruit memanggil function lain yakni getInput.
 
func deleteFruit() {
    showAllFruits()
    if let position = getInputInt(message: "Pilih posisi buah yang akan dihapus"),
        position<=listFruits.count && position>0{
        listFruits.remove(at: position-1)
    }else{
        deleteFruit()
        print("Input tidak valid")
    }
}

func showMenu(){
    print("Selamat Datang di Dicoding Market")
    print("---------------MENU---------------")
    print("[1] Tampilkan semua buah")
    print("[2] Tambah item buah")
    print("[3] Ubah item buah")
    print("[4] Hapus item buah")
    print("[5] Keluar")
    if let position = getInputInt(message: "Silakan pilih menu di atas"), position<=5 && position>0{
        print("----------------------------------")
        switch position {
        case 1:
            showAllFruits()
            break
        case 2:
            insertFruit()
            break
        case 3:
            editFruit()
            break
        case 4:
            deleteFruit()
            break
        case 5:
            isRunning = false
            print("Terima kasih, silakan datang kembali!")
            break
        default:
            print("Pilihan Anda salah")
        }
    } else {
        print("Item menu tidak valid")
    }
    print("----------------------------------")
}
 
 
while isRunning {
    showMenu()
}
