package SL::DB::PurchaseInvoice;

use strict;

use SL::DB::MetaSetup::PurchaseInvoice;
use SL::DB::Manager::PurchaseInvoice;

__PACKAGE__->meta->add_relationship(invoiceitems => { type         => 'one to many',
                                                      class        => 'SL::DB::InvoiceItem',
                                                      column_map   => { id => 'trans_id' },
                                                      manager_args => { with_objects => [ 'part' ] }
                                                    },
                                   );

__PACKAGE__->meta->initialize;

sub items { goto &invoiceitems; }

1;
