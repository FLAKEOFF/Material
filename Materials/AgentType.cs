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
    
    public partial class AgentType
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string Image { get; set; }
    
        public virtual Agents Agents { get; set; }
    }
}
