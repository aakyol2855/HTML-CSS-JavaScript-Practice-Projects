


private void buttonCek_Click(object sender, EventArgs e)
        {
            var url = new Uri("https://www.bloomberght.com/doviz/dolar"); // url oluştruduk
            var client = new WebClient(); // siteye erişim için client tanımladık
            var html = client.DownloadString(url); //sitenin html lini indirdik
            HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument(); //burada HtmlAgilityPack Kütüphanesini kullandık
            doc.LoadHtml(html); // indirdiğimiz sitenin html lini oluşturduğumuz dokumana dolduruyoruz
            var veri = doc.DocumentNode.SelectNodes("/html/body/div[1]/div[5]/div[4]/div/div/div[1]/div/div[2]/div/div[1]/div/text()")[0]; // siteden aldığımız xpath i buraya yazıp kaynak kısmını seçiyoruz
            if (veri != null)
            {
                label1.Text = "Dolar:" + veri.InnerHtml;
            }

        }