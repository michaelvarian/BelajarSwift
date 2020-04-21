import Foundation
//Kita akan membuat form data diri
print("Selamat Datang di Dicoding Academy")
print("------------------")

// Kode ini digunakan untuk memasukkan input dari pengguna
print("Masukan nama depan Anda"); let firstName = readLine()!
print("Masukan nama belakang Anda"); let lastName = readLine()!
print("Masukan umur Anda"); let age = readLine()!
print("Masukan alamat Anda"); let address = readLine()!
print("Masukan pekerjaan Anda"); let job = readLine()


let fullName = firstName + " " + lastName

print("------------------")

// Ini adalah salah satu output dari program yang Anda buat
print("Apakah kalian tahu \(fullName)?")
print("\(firstName) adalah seorang \(job)")
print("Saat ini ia berumur \(age) dan bertempat tinggal di \(address)")
print("-----------------")
