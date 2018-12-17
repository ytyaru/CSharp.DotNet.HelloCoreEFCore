# 1. デフォルトプロジェクト作成
mkdir -p /tmp/work/DotNetProjects/HelloCoreEFCore
cd /tmp/work/DotNetProjects/HelloCoreEFCore
dotnet new console
dotnet restore
dotnet publish -r linux-arm
/tmp/work/DotNetProjects/HelloCoreEFCore/bin/Debug/netcoreapp2.2/linux-arm/HelloCoreEFCore

# 2. ソースコード作成（手動）

# 3. EFCore一式入手
dotnet add package Microsoft.EntityFrameworkCore.Tools.DotNet
dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet add package Microsoft.EntityFrameworkCore.Tools
dotnet add package Microsoft.EntityFrameworkCore.Sqlite

# 4. コンパイル
dotnet restore
dotnet publish -r linux-arm

# 5. DBファイル作成
dotnet ef migrations add FirstMigration_CreateTable
dotnet ef database update

# 6. DBファイル内容確認
sqlite3 /tmp/work/hello.db ".tables"
sqlite3 /tmp/work/hello.db ".schema"
sqlite3 /tmp/work/hello.db "select * from Accounts;"
