using System.ComponentModel;
using System.Collections.ObjectModel;
using System.Management.Automation;

public class Services : INotifyPropertyChanged
{
    private readonly ObservableCollection<Item> _items = new ObservableCollection<Item>();

    public ObservableCollection<Item> Items
    {
        get { return _items; }
    }

    public event PropertyChangedEventHandler PropertyChanged;

    private void NotifyPropertyChanged(string property)
    {
        if(PropertyChanged != null)
        {
            PropertyChanged(this, new PropertyChangedEventArgs(property));
        }
    }
}
