using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Materials
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            //Binding DataGridMaterials
            var datamaterials = Helper.GetContext().Material.ToList();
            DataGridMaterials.ItemsSource = datamaterials;
        }
        //Сообщения для кнопок
        private void ButtonPage1_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Вы находитесь на этой странице");
        }

        private void ButtonPage2_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Страница номер 2 временно недоступна");
        }

        private void ButtonPage3_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Страница номер 3 временно недоступна");
        }
    }
}
