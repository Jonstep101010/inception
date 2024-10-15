FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y vsftpd curl

COPY --chown=root:root vsftpd.conf /etc/vsftpd.conf

EXPOSE 20 21 30000-30009

ARG FTP_USER
ARG FTP_PASS
RUN useradd -m $FTP_USER
# set password for $FTP_USER
RUN echo "$FTP_USER:$FTP_PASS" | chpasswd
# add user to vsftpd userlist
RUN echo "$FTP_USER" >> /etc/vsftpd.userlist

RUN mkdir -p /home/$FTP_USER/ftp/files /var/run/vsftpd/empty

# modify permissions to only allow $FTP_USER to access files
RUN chown nobody:nogroup /home/$FTP_USER/ftp
RUN chmod a-w /home/$FTP_USER/ftp
RUN chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files

# append expanded value of $FTP_USER/ftp to local_root=/home/
RUN echo "${FTP_USER}/ftp" >> /etc/vsftpd.conf

ENTRYPOINT ["/usr/sbin/vsftpd",  "/etc/vsftpd.conf" ]