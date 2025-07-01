import os
import shutil
from datetime import datetime, timedelta


def archive_old_bronze_data(
        base_bronze_path: str,
        archive_bronze_path: str,
        retention_days: int,
        table_name: str
) -> None:
    '''Archives bronze data older than retention_days.'''
    print(
        f'Starting archive for {table_name} in {base_bronze_path} older than {retention_days} days.')

    source_table_path = os.path.join(base_bronze_path, 'mysql', table_name)
    archive_table_path = os.path.join(archive_bronze_path, 'mysql', table_name)
    os.makedirs(archive_table_path, exist_ok=True)

    cutoff_date = datetime.now() - timedelta(days=retention_days)

    for year_dir in os.listdir(source_table_path):
        year_path = os.path.join(source_table_path, year_dir)
        if not os.path.isdir(year_path):
            continue
        try:
            year = int(year_dir)
            for month_dir in os.listdir(year_path):
                month_path = os.path.join(year_path, month_dir)
                if not os.path.isdir(month_path):
                    continue
                try:
                    month = int(month_dir)
                    for day_dir in os.listdir(month_path):
                        day_path = os.path.join(month_path, day_dir)
                        if not os.path.isdir(day_path):
                            continue
                        try:
                            day = int(day_dir)
                            current_date = datetime(year, month, day)
                            if current_date < cutoff_date:
                                archive_dest_year_path = os.path.join(
                                    archive_table_path, year_dir)
                                os.makedirs(archive_dest_year_path,
                                            exist_ok=True)
                                archive_dest_month_path = os.path.join(
                                    archive_dest_year_path, month_dir)
                                os.makedirs(
                                    archive_dest_month_path, exist_ok=True)

                                source_full_day_path = day_path
                                archive_full_day_path = os.path.join(
                                    archive_dest_month_path, day_dir)

                                print(
                                    f'Archiving {source_full_day_path} to {archive_full_day_path}')
                                shutil.move(source_full_day_path,
                                            archive_full_day_path)
                                # Optionally, compress after moving:
                                # shutil.make_archive(archive_full_day_path, 'gztar', archive_dest_month_path, day_dir)
                                # shutil.rmtree(archive_full_day_path) # Remove original uncompressed moved folder
                        except ValueError:  # Invalid day
                            print(f'Skipping invalid day directory: {day_dir}')
                except ValueError:  # Invalid month
                    print(f'Skipping invalid month directory: {month_dir}')
        except ValueError:  # Invalid year
            print(f'Skipping invalid year directory: {year_dir}')
    print(f'Archiving completed for {table_name}.')
