//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Materials
{
    using System;
    using System.Collections.Generic;
    
    public partial class MaterialType
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int DeferentPrecent { get; set; }
    
        public virtual Material Material { get; set; }
    }
}
