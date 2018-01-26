package br.com.ifpe.psyChomics.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Calendar;

import org.springframework.web.multipart.MultipartFile;

public class Util {

	public static boolean fazerUploadImagem(MultipartFile imagem) {
		boolean sucessoUpload = false;
		if (!imagem.isEmpty()) {
			String nomeArquivo = imagem.getOriginalFilename();
			try {
				// Criando o diretório para armazenar o arquivo
				String workspaceProjeto = "/home/aluno/eclipse-workspace/PsyChomics/psyChomics";
				File dir = new File(workspaceProjeto + "/WebContent/view/psyChomics/imagens");
				if (!dir.exists()) {
					dir.mkdirs();
				}
				// Criando o arquivo no diretório
				File serverFile = new File(dir.getAbsolutePath() + File.separator + Calendar.getInstance().getTime()
						+ " - " + nomeArquivo);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(imagem.getBytes());
				stream.close();
				System.out.println("Arquivo armazenado em:" + serverFile.getAbsolutePath());
				System.out.println("Você fez o upload do arquivo " + nomeArquivo + " com sucesso");
				sucessoUpload = true;
			} catch (Exception e) {
				System.out.println("Você falhou em carregar o arquivo " + nomeArquivo + " => " + e.getMessage());
			}
		} else {
			System.out.println("Você falhou em carregar o arquivo porque ele está vazio ");
		}
		return sucessoUpload;
	}
}
