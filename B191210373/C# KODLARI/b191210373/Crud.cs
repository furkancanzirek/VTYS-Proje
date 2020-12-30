using System;
using System.Collections.Generic;
using System.Text;
using Npgsql;
namespace b191210373
{
    class Crud
    {
        NpgsqlConnection connection = new NpgsqlConnection("Server=localhost; Port=5432; Database=b191210373; User Id=postgres; Password=zorsifre123;");

        public void uyelikAc(string ad, string soyad, int telefon ,string email, int tc, string sehir,string ilce,string adres,int tur)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "";
            if(tur == 1)
            {
                 sql = "INSERT INTO musteri (ad,soyad,telefon,tcno,email,sehir,ilce,adres) values ('" + ad + "','" + soyad + "','" + telefon + "','" + tc + "','" + email + "','" + sehir + "','" + ilce + "','" + adres + "')";
            }
            else if (tur == 2)
            {
                 sql = "INSERT INTO personel (ad,soyad,telefon,tcno,email,sehir,ilce,adres) values ('" + ad + "','" + soyad + "','" + telefon + "','" + tc + "','" + email + "','" + sehir + "','" + ilce + "','" + adres + "')";
            }
            
            NpgsqlCommand cmd = new NpgsqlCommand(sql, connection);
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        public string giris(int id,int tur)
        {
            // Connect to a PostgreSQL database
            connection.Open();
            string sql = "";
            if(tur == 1)
            {
                 sql = "SELECT ad FROM musteri WHERE id ='" + id + "'";
            }
            else if(tur == 2)
            {
                 sql = "SELECT ad FROM personel WHERE id ='" + id + "'";
            }

            // Define a query returning a single row result set
            NpgsqlCommand command = new NpgsqlCommand(sql, connection);

            // Execute the query and obtain the value of the first column of the first row
            string ad = command.ExecuteScalar().ToString();
            connection.Close();
            return ad;

        }

        public void uyelikSil(int id,int tur)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "";
            if (tur == 1)
            {
                sql = "DELETE FROM musteri WHERE id ='" + id + "'";
            }
            else if (tur == 2)
            {
                sql = "DELETE FROM personel WHERE id ='" + id + "'";
            }
            NpgsqlCommand command = new NpgsqlCommand(sql, connection);
            command.ExecuteNonQuery();
            connection.Close();
        }

        public void uyeligimiGuncelle(int tur, string ad, string soyad,int telefon, string email, int tc, string sehir, string ilce, string adres,int id)
        {
            try { connection.Open(); } catch (Exception e) { }
            string sql = "";
            if(tur == 1)
                sql = "UPDATE \"musteri\" SET \"ad\"=\'" + ad + "\', \"soyad\"=\'" + soyad + "\',\"telefon\"=\'" + telefon + "\',\"email\"=\'" + email + "\',\"tcno\"=\'" + tc + "\',\"sehir\"=\'" + sehir + "\' ,\"ilce\"=\'" + ilce + "\',\"adres\"=\'" + adres + "\' WHERE \"id\"=\'" + id + "\'";
            else if(tur == 2)
                sql = "UPDATE \"personel\" SET \"ad\"=\'" + ad + "\', \"soyad\"=\'" + soyad +"\',\"telefon\"=\'"+ telefon + "\',\"email\"=\'" + email + "\',\"tcno\"=\'" + tc + "\',\"sehir\"=\'" + sehir + "\' ,\"ilce\"=\'" + ilce + "\',\"adres\"=\'" + adres + "\' WHERE \"id\"=\'" + id + "\'";
            NpgsqlCommand command = new NpgsqlCommand(sql, connection);
            command.ExecuteNonQuery();
            connection.Close();
        }

        public void listele(int tur)
        {
            connection.Open();
            string sql = "";
            if (tur == 1)
                sql = "SELECT urun_ad,marka,satış_fiyat FROM urun";
            else if (tur == 2)
                sql = "SELECT banka_adi, sube, yetkili_no FROM banka";
            else if (tur == 3)
                sql = "SELECT ad,yetkili_statü,yetkili_adi FROM firma";

            // Define a query returning a single row result set
            NpgsqlCommand command = new NpgsqlCommand(sql, connection);

            NpgsqlDataReader dr = command.ExecuteReader();
            int count = 1;
            while (dr.Read())
            {
                Console.WriteLine(count + "-){0}\t{1}\t{2}\n", dr[0], dr[1],dr[2]);
                count++;
            }
            connection.Close();
        }
    }
}
