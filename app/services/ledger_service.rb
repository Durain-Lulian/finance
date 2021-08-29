class LedgerService
    def self.client
        cred = Aws::Credentials.new(ENV['AWS_ACCESS_KEY'], ENV['AWS_SECRET_ACCESS_KEY'])

        qldb_session_client = Aws::QLDBSession::Client.new(region: 'ap-southeast-1', 
            credentials: cred, 
            access_key_id: ENV['AWS_ACCESS_KEY'],
            secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
        )

        start_session_req = Aws::QLDBSession::Types::StartSessionRequest.new
        start_session_req.ledger_name = 'finance-ledger'


        command_request = Aws::QLDBSession::Types::SendCommandRequest.new

        command_request.start_session = start_session_req

        resp = qldb_session_client.send_command(command_request)
        session_token = resp.start_session.session_token

        command_request = Aws::QLDBSession::Types::SendCommandRequest.new
        command_request.session_token = session_token
        command_request.start_transaction = Aws::QLDBSession::Types::StartTransactionRequest.new
        resp = qldb_session_client.send_command(command_request)
        transaction_id = resp.start_transaction.transaction_id

        command_request = Aws::QLDBSession::Types::SendCommandRequest.new
        command_request.session_token = session_token
        command_request.execute_statement = Aws::QLDBSession::Types::ExecuteStatementRequest.new
        command_request.execute_statement.transaction_id = transaction_id
        command_request.execute_statement.statement = 'INSERT INTO Logs `{"LoggableId":"11234", "LoggableType":"UserInsurance", "ReceiptAmount": 24, "ReceiptId": "1234", "Reason":"Insurance"}`'

        resp = qldb_session_client.send_command(command_request)
        resp.execute_statement
        result = resp.execute_statement.first_page.values[0]

        puts result 
        puts result 
        puts result 
        puts result 

        puts resp
    end
end 