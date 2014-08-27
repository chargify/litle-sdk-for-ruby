=begin
Copyright (c) 2012 Litle & Co.

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
=end

require File.expand_path("../../../lib/LitleOnline",__FILE__) 
require 'test/unit'
require 'fileutils'

module LitleOnline
  class LitleBatchCertTest < Test::Unit::TestCase
    def setup
      path = "/tmp/litle-sdk-for-ruby"
      FileUtils.rm_rf path
      if(!File.directory?(path))
        Dir.mkdir(path)
      end
      path = "/tmp/litle-sdk-for-ruby/cert/"
      if(!File.directory?(path))
        Dir.mkdir(path)
      end
    end
  
    def test_MEGA_batch
      authHash = {
        'reportGroup'=>'Planets',
        'orderId'=>'12344',
        'amount'=>'106',
        'orderSource'=>'ecommerce',
        'card'=>{
          'type'=>'VI',
          'number' =>'4100000000000001',
          'expDate' =>'1210'
        }}

      saleHash = {
        'reportGroup'=>'Planets',
        'id' => '006',
        'orderId'=>'12344',
        'amount'=>'6000',
        'orderSource'=>'ecommerce',
        'card'=>{
          'type'=>'VI',
          'number' =>'4100000000000001',
          'expDate' =>'1210'
        }}

      creditHash = {
        'merchantId' => '101',
        'version'=>'8.8',
        'reportGroup'=>'Planets',
        'orderId'=>'12344',
        'amount'=>'106',
        'orderSource'=>'ecommerce',
        'card'=>{
          'type'=>'VI',
          'number' =>'4100000000000001',
          'expDate' =>'1210'
        }}

      authReversalHash = {
        'merchantId' => '101',
        'version'=>'8.8',
        'reportGroup'=>'Planets',
        'litleTxnId'=>'12345678000',
        'amount'=>'106',
        'payPalNotes'=>'Notes'
      }

      registerTokenHash = {
        'merchantId' => '101',
        'version'=>'8.8',
        'reportGroup'=>'Planets',
        'orderId'=>'12344',
        'accountNumber'=>'1233456789103801'
      }

      updateCardHash = {
        'merchantId' => '101',
        'version'=>'8.8',
        'reportGroup'=>'Planets',
        'id'=>'12345',
        'customerId'=>'0987',
        'orderId'=>'12344',
        'litleToken'=>'1233456789103801',
        'cardValidationNum'=>'123'
      }
      
      forceCaptHash = {
        'merchantId' => '101',
        'version'=>'8.8',
        'reportGroup'=>'Planets',
        'litleTxnId'=>'123456',
        'orderId'=>'12344',
        'amount'=>'106',
        'orderSource'=>'ecommerce',
        'card'=>{
          'type'=>'VI',
          'number' =>'4100000000000001',
          'expDate' =>'1210'
        }}

      captHash = {
        'merchantId' => '101',
        'version'=>'8.8',
        'reportGroup'=>'Planets',
        'litleTxnId'=>'123456000',
        'amount'=>'106',
      }

      captGivenAuthHash = {
        'merchantId' => '101',
        'version'=>'8.8',
        'reportGroup'=>'Planets',
        'orderId'=>'12344',
        'amount'=>'106',
        'authInformation' => {
          'authDate'=>'2002-10-09','authCode'=>'543216',
          'authAmount'=>'12345'
        },
        'orderSource'=>'ecommerce',
        'card'=>{
          'type'=>'VI',
          'number' =>'4100000000000000',
          'expDate' =>'1210'
        }}

      echeckVerificationHash = {
        'merchantId' => '101',
        'version'=>'8.8',
        'reportGroup'=>'Planets',
        'amount'=>'123456',
        'orderId'=>'12345',
        'orderSource'=>'ecommerce',
        'echeck' => {'accType'=>'Checking','accNum'=>'12345657890','routingNum'=>'123456789','checkNum'=>'123455'},
        'billToAddress'=>{'name'=>'Bob','city'=>'lowell','state'=>'MA','email'=>'litle.com'}
      }

      echeckCreditHash = {
        'merchantId' => '101',
        'version'=>'8.8',
        'reportGroup'=>'Planets',
        'litleTxnId'=>'123456789101112',
        'amount'=>'12'
      }

      echeckRedeopsitHash = {
        'merchantId' => '101',
        'version'=>'8.8',
        'reportGroup'=>'Planets',
        'litleTxnId'=>'123456'
      }

      echeckSaleHash = {
        'merchantId' => '101',
        'version'=>'8.8',
        'reportGroup'=>'Planets',
        'amount'=>'123456',
        'verify'=>'true',
        'orderId'=>'12345',
        'orderSource'=>'ecommerce',
        'echeck' => {'accType'=>'Checking','accNum'=>'12345657890','routingNum'=>'123456789','checkNum'=>'123455'},
        'billToAddress'=>{'name'=>'Bob','city'=>'lowell','state'=>'MA','email'=>'litle.com'}
      }

      accountUpdateHash = {
        'reportGroup'=>'Planets',
        'id'=>'12345',
        'customerId'=>'0987',
        'orderId'=>'1234',
        'card'=>{
          'type'=>'VI',
          'number' =>'4100000000000001',
          'expDate' =>'1210'
        }}
      
      path = "/tmp/litle-sdk-for-ruby/cert/"

      request = LitleRequest.new({'sessionId'=>'8675309'})

      request.create_new_litle_request(path)
      batch = LitleBatchRequest.new
      batch.create_new_batch(path)
    
      batch.account_update(accountUpdateHash)
      batch.auth_reversal(authReversalHash)
      batch.authorization(authHash)
      batch.capture(captHash)
      batch.capture_given_auth(captGivenAuthHash)
      batch.credit(creditHash)
      batch.echeck_credit(echeckCreditHash)
      batch.echeck_redeposit(echeckRedeopsitHash)
      batch.echeck_sale(echeckSaleHash)
      batch.echeck_verification(echeckVerificationHash)
      batch.force_capture(forceCaptHash)
      batch.register_token_request(registerTokenHash)
      batch.sale(saleHash)
      batch.update_card_validation_num_on_token(updateCardHash)
      
      #close the batch, indicating we plan to add no more transactions
      batch.close_batch()
      #add the batch to the LitleRequest
      request.commit_batch(batch)
      #finish the Litle Request, indicating we plan to add no more batches
      request.finish_request

      #send the batch files at the given directory over sFTP
      request.send_to_litle

      #grab the expected number of responses from the sFTP server and save them to the given path
      request.get_responses_from_server()
      
      count = 0
      #process the responses from the server with a listener which applies the given block
      request.process_responses({:transaction_listener => LitleOnline::DefaultLitleListener.new do |transaction|
          assert_not_nil transaction["litleTxnId"] =~ /\d+/
          assert_not_nil transaction["response"] =~ /\d+/
          assert_not_nil transaction["message"]
          count+=1
      end})
      assert_equal count, 14
    end
    
    def test_mini_batch_borked_counts
      echeckSaleHash = {
        'merchantId' => '101',
        'version'=>'8.8',
        'reportGroup'=>'Planets',
        'amount'=>'123456',
        'verify'=>'true',
        'orderId'=>'12345',
        'orderSource'=>'ecommerce',
        'echeck' => {'accType'=>'Checking','accNum'=>'12345657890','routingNum'=>'123456789','checkNum'=>'123455'},
        'billToAddress'=>{'name'=>'Bob','city'=>'lowell','state'=>'MA','email'=>'litle.com'}
      }
      
      path = "/tmp/litle-sdk-for-ruby/cert/"

      request = LitleRequest.new({'sessionId'=>'8675309'})

      request.create_new_litle_request(path)
      batch = LitleBatchRequest.new
      batch.create_new_batch(path)
      
      batch.echeck_sale(echeckSaleHash)
      
      #make this a bad batch
      batch.get_counts_and_amounts[:sale][:numSales] += 1  
      #close the batch, indicating we plan to add no more transactions
      batch.close_batch()
      #add the batch to the LitleRequest
      request.commit_batch(batch)

      #finish the Litle Request, indicating we plan to add no more batches
      request.finish_request

      #send the batch files at the given directory over sFTP
      request.send_to_litle

      #grab the expected number of responses from the sFTP server and save them to the given path
      request.get_responses_from_server()

      assert_raise RuntimeError do
        #process the responses from the server with a listener which applies the given block
        request.process_responses({:transaction_listener => LitleOnline::DefaultLitleListener.new do |transaction|
        end})
      end
    end
    
    def test_mini_batch_borked_amounts
      echeckSaleHash = {
        'merchantId' => '101',
        'version'=>'8.8',
        'reportGroup'=>'Planets',
        'amount'=>'123456',
        'verify'=>'true',
        'orderId'=>'12345',
        'orderSource'=>'ecommerce',
        'echeck' => {'accType'=>'Checking','accNum'=>'12345657890','routingNum'=>'123456789','checkNum'=>'123455'},
        'billToAddress'=>{'name'=>'Bob','city'=>'lowell','state'=>'MA','email'=>'litle.com'}
      }
      
      path = "/tmp/litle-sdk-for-ruby/cert/"

      request = LitleRequest.new({'sessionId'=>'8675309'})

      request.create_new_litle_request(path)
      batch = LitleBatchRequest.new
      batch.create_new_batch(path)
      
      batch.echeck_sale(echeckSaleHash)
      
      #make this a bad batch
      batch.get_counts_and_amounts[:sale][:saleAmount] += 1  
      #close the batch, indicating we plan to add no more transactions
      batch.close_batch()
      #add the batch to the LitleRequest
      request.commit_batch(batch)

      #finish the Litle Request, indicating we plan to add no more batches
      request.finish_request

      #send the batch files at the given directory over sFTP
      request.send_to_litle

      #grab the expected number of responses from the sFTP server and save them to the given path
      request.get_responses_from_server()

      # we are checking the litleResponse header for a filed response code and raising it as an error
      assert_raise RuntimeError do
        #process the responses from the server with a listener which applies the given block
        request.process_responses({:transaction_listener => LitleOnline::DefaultLitleListener.new do |transaction|
        end})
      end
    end
  end
end