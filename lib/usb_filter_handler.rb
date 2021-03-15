module UsbFilterHandler

    def self.filter_exists(vendor_id, product_id)
        # Determine if a usb filter with the provided Vendor/Product ID combination
        # already exists on this VM.
        
        machine_id_filepath = File.join(File.expand_path(File.dirname(__FILE__)), "..", ".vagrant", "machines", "default", "virtualbox", "id")
        return false unless File.exists? machine_id_filepath
        
        vm_info = `VBoxManage showvminfo $(<#{machine_id_filepath})`.downcase
        filter_match = "VendorId:         #{vendor_id}\nProductId:        #{product_id}\n".downcase
        vm_info.include? filter_match
    end
        
    def self.add_filter(vb, vendor_id, product_id, filter_name, filter_product)
        # This is a workaround for the fact VirtualBox doesn't provide
        # a way for preventing duplicate USB filters from being added.
        
        unless filter_exists(vendor_id, product_id)
            vb.customize ["usbfilter", "add", "0",
                        "--target", :id,
                        "--name", filter_name,
                        "--vendorid", vendor_id,
                        "--productid", product_id,
                        "--product", filter_product
                        ]
        end
    end    

end
