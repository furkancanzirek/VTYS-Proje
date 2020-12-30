using System;
using Npgsql;
namespace b191210373
{
    class Program
    {
        static string RastgeleKelime()
        {
            Random rastgele = new Random();
            string harfler = "ABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZabcçdefgğhıijklmnoöprsştuüvyz";
            string uret = "";
            for (int i = 0; i < 6; i++)
            {
                uret += harfler[rastgele.Next(harfler.Length)];
            }
            return uret;
        }
        static void Main(string[] args)
        {
            Crud crud = new Crud();
            int index;
            string ctrl;
            bool devam = true;
            bool alt_devam = true;
            int m_or_p = 0;
            int id=0;

            while (devam == true)
            {
                Console.WriteLine("Merhabalar, Sistemimize hoşgeldiniz. Üyeliğiniz var ise 1'i yok ise 2'yi tuşlayınız.");
                index = Convert.ToInt32(Console.ReadLine());
                if (index == 1)
                {
                    Console.WriteLine("Personel iseniz 'Personel',Müşteri iseniz 'Müşteri' yazınız.");
                    ctrl = Console.ReadLine();
                    if (ctrl.ToLower() == "personel")
                    {
                        Console.Write("ID Numaranızı giriniz");
                        id = Convert.ToInt32(Console.ReadLine());
                        m_or_p = 2;
                        Console.WriteLine("Hoşgeldiniz " + crud.giris(id, m_or_p));
                        devam = false;
                    }
                    else if (ctrl.ToLower() == "müşteri")
                    {
                        Console.Write("ID Numaranızı giriniz");
                        id = Convert.ToInt32(Console.ReadLine());
                        m_or_p = 1;
                        Console.WriteLine("Hoşgeldiniz " + crud.giris(id, m_or_p));
                        devam = false;
                    }
                    else
                    {
                        Console.WriteLine("Hatalı Tuşlama Yaptınız.");
                        alt_devam = true;
                    }
                }
                else if (index == 2)
                {
                    Console.Write("Müşteri üyeliği için 'Müşteri',Personel üyeliği için 'Personel' yazınız: ");
                    ctrl = Console.ReadLine();
                    Console.Write("İsim: ");
                    string isim = Console.ReadLine();
                    Console.Write("Soyisim: ");
                    string soyisim = Console.ReadLine();
                    Console.Write("Telefon No: ");
                    int telefon = Convert.ToInt32(Console.ReadLine());
                    Console.Write("TC Kimlik No: ");
                    int tc = Convert.ToInt32(Console.ReadLine());
                    Console.Write("E-Mail: ");
                    string mail = Console.ReadLine();
                    Console.Write("Şehir: ");
                    string sehir = Console.ReadLine();
                    Console.Write("ilçe: ");
                    string ilce = Console.ReadLine();
                    Console.Write("Açık Adres: ");
                    string adres = Console.ReadLine();

                    bool derin_devam = true;
                    while (derin_devam == true)
                    {
                        if (ctrl.ToLower() == "müşteri")
                        {
                            derin_devam = false;
                            alt_devam = false;
                            m_or_p = 1;
                        }

                        else if (ctrl.ToLower() == "personel")
                        {
                            derin_devam = false;
                            m_or_p = 2;
                            alt_devam = false;
                        }
                        else
                        {
                            Console.WriteLine("Hatala Tuşlama yaptınız.");
                            alt_devam = false;
                            derin_devam = true;
                        }
                    }
                    devam = false;
                    crud.uyelikAc(isim, soyisim, telefon, mail, tc, sehir, ilce, adres, m_or_p);
                    Console.WriteLine("Yeni Üyelik Açtığınız İçin Yeniden Giriş Yapmanız Gerekmektedir.");
                }
                while (alt_devam == true)
                {
                    Console.WriteLine("1-Urunleri Listele");
                    Console.WriteLine("2-Anlaşmalı Bankaları Listele");
                    Console.WriteLine("3-Anlaşmalı Firmaları Listele");
                    Console.WriteLine("4-Üyelik Bilgilerimi Güncelle");
                    Console.WriteLine("5-Üyeliğimi Sil");
                    Console.WriteLine("6-Üst Menüye Dön");
                    Console.WriteLine("7-Çıkış");
                    index = Convert.ToInt32(Console.ReadLine());
                    if (index == 1)
                        crud.listele(1);
                    else if (index == 2)
                        crud.listele(2);
                    else if (index == 3)
                        crud.listele(3);
                    else if (index == 4)
                    {
                        Console.Write("İsim: ");
                        string isim = Console.ReadLine();
                        Console.Write("Soyisim: ");
                        string soyisim = Console.ReadLine();
                        Console.Write("Telefon No: ");
                        int telefon = Convert.ToInt32(Console.ReadLine());
                        Console.Write("TC Kimlik No: ");
                        int tc = Convert.ToInt32(Console.ReadLine());
                        Console.Write("E-Mail: ");
                        string mail = Console.ReadLine();
                        Console.Write("Şehir: ");
                        string sehir = Console.ReadLine();
                        Console.Write("ilçe: ");
                        string ilce = Console.ReadLine();
                        Console.Write("Açık Adres: ");
                        string adres = Console.ReadLine();
                        crud.uyeligimiGuncelle(m_or_p, isim, soyisim, telefon, mail, tc, sehir, ilce, adres, id);
                        Console.WriteLine("Üyelik Bilgileri Güncellenmiştir.");
                    }
                    else if (index == 5)
                    {
                        alt_devam = false;
                        devam = true;
                        crud.uyelikSil(id, m_or_p);
                    }
                    else if (index == 6)
                    {
                        alt_devam = false;
                        devam = true;
                    }

                    else if (index == 7)
                    {
                        alt_devam = false;
                        devam = false;
                    }
                    else
                        Console.WriteLine("Hatalı Tuşlama Yaptınız.");
                }
            }
        }

        
    }
}
